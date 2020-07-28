package org.elinext.task.service;

import org.elinext.task.exception.ReservationSaveException;
import org.elinext.task.model.Reservation;
import org.elinext.task.repository.ReservationRepository;
import org.elinext.task.util.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
public class ReservationServiceImpl implements ReservationService {

    private ReservationRepository reservationRepository;

    @Autowired
    public ReservationServiceImpl(ReservationRepository reservationRepository) {
        this.reservationRepository = reservationRepository;
    }

    @Override
    public Optional<Reservation> findById(Long id) {
        return reservationRepository.findById(id);
    }

    @Override
    public List<Reservation> findAll() {
        List<Reservation> reservations = reservationRepository.findAll();
        reservations.sort(Comparator.comparing(Reservation::getReservationId));
        return reservations;
    }

    @Override
    public Reservation save(Reservation reservation) {
        Long reservationId = reservation.getReservationId();

        if (reservationId == null) {
            return reservationRepository.save(reservation);
        }

        List<Reservation> allReservationsByUser = reservationRepository.findAllByUser(reservation.getUser());

        boolean isUserFree = isFree(reservation, allReservationsByUser);

        if (!isUserFree) {
            throw new ReservationSaveException(String.format("Can't save reservation id = %d! User %d not free!", reservationId, reservation.getUser().getUserId()));
        }

        List<Reservation> allReservationsByRoom = reservationRepository.findAllByRoom(reservation.getRoom());

        boolean isRoomFree = isFree(reservation, allReservationsByRoom);

        if (!isRoomFree) {
            throw new ReservationSaveException(String.format("Can't save reservation id = %d! Room %s not free!", reservationId, reservation.getRoom().getRoomName()));
        }

        return reservationRepository.save(reservation);

    }

    @Override
    public void deleteById(Long id) {
        reservationRepository.deleteById(id);
    }

    private boolean isFree(Reservation reservation, List<Reservation> allReservationsByUser) {
        return allReservationsByUser.stream()
                .noneMatch(curReserv -> {
                    if (reservation.getReservationId().equals(curReserv.getReservationId())) {
                        return false;
                    }
                    return TimeUtil.isCross(reservation.getStartTime(), reservation.getEndTime(),
                            curReserv.getStartTime(), curReserv.getEndTime());
                });
    }
}
