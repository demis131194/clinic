package org.elinext.task.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class ScheduleTaskService {

    private ReservationService reservationService;
    private RoomService roomService;

    @Autowired
    public ScheduleTaskService(ReservationService reservationService, RoomService roomService) {
        this.reservationService = reservationService;
        this.roomService = roomService;
    }

    @Scheduled(fixedRate = 1000L*60)
    public void checkReservationStatus() {
        System.out.println("TASK!!!!!!");
    }
}
