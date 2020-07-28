package org.elinext.task.service;

import org.elinext.task.model.Reservation;
import org.elinext.task.model.ReservationStatus;
import org.elinext.task.model.Room;
import org.elinext.task.model.RoomStatus;
import org.elinext.task.repository.ReservationRepository;
import org.elinext.task.repository.RoomRepository;
import org.elinext.task.util.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Service
public class ScheduleTaskService {

    private final static List<ReservationStatus> searchingStatuses = Arrays.asList(ReservationStatus.NEW, ReservationStatus.RUNNING);

    private ReservationRepository reservationRepository;
    private RoomRepository roomRepository;

    @Autowired
    public ScheduleTaskService(ReservationRepository reservationRepository, RoomRepository roomRepository) {
        this.reservationRepository = reservationRepository;
        this.roomRepository = roomRepository;
    }

    @Scheduled(fixedRate = 1000L*60)
    public void checkReservationStatus() {
        List<Reservation> allByStatus = reservationRepository.findAllByStatusIn(searchingStatuses);
        LocalDateTime now = LocalDateTime.now();
        allByStatus.forEach(reservation -> {
            if (TimeUtil.isBetween(now, reservation)) {
                reservation.setStatus(ReservationStatus.RUNNING);
                reservationRepository.saveAndFlush(reservation);

                Room room = reservation.getRoom();
                room.setRoomStatus(RoomStatus.OCCUPIED);
                roomRepository.saveAndFlush(room);

            } else if (now.isAfter(reservation.getEndTime())) {
                reservation.setStatus(ReservationStatus.ENDED);
                reservationRepository.saveAndFlush(reservation);

                Room room = reservation.getRoom();
                room.setRoomStatus(RoomStatus.FREE);
                roomRepository.saveAndFlush(room);
            }
        });
    }
}
