package user;

import org.gitshu.entity.UserEntity;
import org.gitshu.user.dao.UserDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
    public void checkUsernameAndPasswordTest() {
        System.out.println(userDAO.checkUsernameAndPassword("lyq", "lll"));
        System.out.println(userDAO.checkUsernameAndPassword("+++", "+++"));
    }

    @Test
    public void getAllUserEntitiesTest() {
        List<UserEntity> userEntityArrayList = userDAO.getAllUserEntities();
        for (UserEntity userEntity : userEntityArrayList) {
            System.out.println(userEntity.getId() + " " + userEntity.getUsername());
        }
    }
}
