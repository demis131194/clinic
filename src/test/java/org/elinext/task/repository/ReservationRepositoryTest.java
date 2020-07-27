package org.elinext.task.repository;

import org.elinext.task.config.SpringTestConfig;
import org.elinext.task.model.Reservation;
import org.elinext.task.model.ReservationStatus;
import org.elinext.task.model.Room;
import org.elinext.task.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.time.LocalDateTime;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringTestConfig.class)
@Sql(scripts = "classpath:db/test-init-data.sql")
public class ReservationRepositoryTest {

    @Autowired
    private ReservationRepository reservationRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoomRepository roomRepository;

    @PersistenceContext
    private EntityManager entityManager;

    @Test
    public void saveTest() {
        User user = userRepository.findById(1L).get();
        Room room = roomRepository.findById(3L).get();
        Reservation reservation = new Reservation(null, "test_operation", null,
                LocalDateTime.parse("2020-05-01T04:05:06"), LocalDateTime.parse("2020-05-01T15:05:06"),
                ReservationStatus.NEW, user, room);
        reservationRepository.saveAndFlush(reservation);
        Reservation actualReservation = entityManager.find(Reservation.class, reservation.getReservationId());
        assertEquals(reservation, actualReservation);
    }

    @Test
    public void updateTest() {
        Reservation reservation = reservationRepository.findById(2L).get();

        reservation.setOperationName("Update Operation!!");
        reservation.setEndTime(LocalDateTime.parse("2020-11-01T15:05:06"));

        reservationRepository.saveAndFlush(reservation);

        Reservation actualRoom = entityManager.find(Reservation.class, reservation.getReservationId());

        assertEquals(reservation, actualRoom);
    }

    @Test
    public void deleteTest() {
        int initSize = reservationRepository.findAll().size();
        int expectedSize =  initSize > 0 ? initSize - 1 : initSize;
        reservationRepository.deleteById(1L);
        int actualSize = reservationRepository.findAll().size();
        assertEquals(expectedSize, actualSize);
    }

}