package org.elinext.task.service;

import org.elinext.task.model.Room;

import java.util.List;
import java.util.Optional;

public interface RoomService {
    Optional<Room> findById(Long id);
    List<Room> findAll();
    Room save(Room room);
    void deleteById(Long id);
}
