package user;

import org.gitshu.user.dao.UserDAO;
import org.gitshu.user.entity.UserEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.persistence.NoResultException;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Lodour on 17/5/28 09:21.
 * 测试UserDAO
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-config.xml")
public class UserDAOTest {
    @Autowired
    private UserDAO userDAO;

    @Test
    public void saveTest() {
        try {
            UserEntity user = new UserEntity();
            user.setUsername("lyq2");
            user.setRealName("刘玉琦");
            user.setPassword("lll");
            user.setCreateTime(new Timestamp(System.currentTimeMillis()));
            user.setGender(0);
            userDAO.create(user);
        } catch (DataIntegrityViolationException e) {
            System.out.println("已存在");
        }
    }

    @Test
    public void deleteTest() {
        int id = 3;
        userDAO.delete(id);
    }

    @Test
    public void getByIdTest() {
        UserEntity u = userDAO.getById(1);
        System.out.println(u.getUsername());
    }

    @Test
    public void getByUsernameTest() {
        UserEntity u = userDAO.getByUsername("lyq");
        System.out.println(u.getUsername());
    }

    @Test
    public void getByUsernameAndPasswordTest() {
        try {
            UserEntity v = userDAO.getByUsernameAndPassword("lyq", "lyq");
            System.out.println(v.getCreateTime());
        } catch (NoResultException e) {
            System.out.println("不存在的");
        }
    }

    @Test
    public void updateTest() {
        UserEntity u = userDAO.getByUsername("lyq");
        u.setCreateTime(new Timestamp(System.currentTimeMillis()));
        userDAO.update(u);

        System.out.println(userDAO.getByUsername("lyq").getCreateTime());
    }

    @Test
    public void listTest() {
        List<UserEntity> list = userDAO.getAllUsers();
        for (UserEntity u : list) {
            System.out.println(u.getId() + ": " + u.getUsername());
        }
    }
}
