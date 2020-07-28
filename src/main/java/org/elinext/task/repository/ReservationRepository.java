package org.elinext.task.repository;

import org.elinext.task.model.Reservation;
import org.elinext.task.model.ReservationStatus;
import org.elinext.task.model.Room;
import org.elinext.task.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    List<Reservation> findAllByUser(User user);
    List<Reservation> findAllByRoom(Room room);
    List<Reservation> findAllByStatusIn(List<ReservationStatus> statuses);
}
