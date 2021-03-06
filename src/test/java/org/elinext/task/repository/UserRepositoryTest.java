package org.elinext.task.repository;

import org.elinext.task.config.SpringTestConfig;
import org.elinext.task.model.User;
import org.elinext.task.model.UserRole;
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
public class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @PersistenceContext
    private EntityManager entityManager;

    @Test
    public void saveTest() {
        User user = new User(null, "Dima", "Dmitrievich", UserRole.DOCTOR);
        userRepository.saveAndFlush(user);
        User actualUser = entityManager.find(User.class, user.getUserId());
        assertEquals(user, actualUser);
    }

    @Test
    public void updateTest() {
        User user = new User(2L, "Petya", "Petr", UserRole.DOCTOR);
        userRepository.saveAndFlush(user);
        User actualUser = entityManager.find(User.class, user.getUserId());
        assertEquals(user, actualUser);
    }

    @Test
    public void deleteTest() {
        int expectedSize = 2;
        userRepository.deleteById(2L);
        int actualSize = userRepository.findAll().size();
        assertEquals(expectedSize, actualSize);
    }
}