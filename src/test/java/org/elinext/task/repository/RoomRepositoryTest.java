package org.elinext.task.repository;

import org.elinext.task.config.SpringTestConfig;
import org.elinext.task.model.Room;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringTestConfig.class)
@Sql(scripts = "classpath:db/test-init-data.sql")
public class RoomRepositoryTest {

    @Autowired
    private RoomRepository roomRepository;

    @PersistenceContext
    private EntityManager entityManager;

    @Test
    public void saveTest() {
        Room room = new Room("Test_Room");
        roomRepository.saveAndFlush(room);
        Room actualRoom = entityManager.find(Room.class, room.getRoomId());
        assertEquals(room, actualRoom);
    }

    @Test
    public void updateTest() {
        Room room = new Room(2L, "Test_Update_room");
        roomRepository.saveAndFlush(room);
        Room actualRoom = entityManager.find(Room.class, room.getRoomId());
        assertEquals(room, actualRoom);
    }

    @Test
    public void deleteTest() {
        int initSize = roomRepository.findAll().size();
        int expectedSize =  initSize > 0 ? initSize - 1 : initSize;
        roomRepository.deleteById(2L);
        int actualSize = roomRepository.findAll().size();
        assertEquals(expectedSize, actualSize);
    }
}