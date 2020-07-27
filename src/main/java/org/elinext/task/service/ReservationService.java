package org.elinext.task.service;

import org.elinext.task.model.Reservation;

import java.util.List;
import java.util.Optional;

public interface ReservationService {
    Optional<Reservation> findById(Long id);
    List<Reservation> findAll();
    Reservation save(Reservation user);
    void deleteById(Long id);
}
