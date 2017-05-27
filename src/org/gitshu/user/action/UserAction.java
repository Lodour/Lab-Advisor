package org.gitshu.user.action;

import com.opensymphony.xwork2.ModelDriven;
import org.gitshu.user.entity.UserEntity;
import org.gitshu.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

/**
 * Created by Lodour on 17/5/27 01:54.
 * <p>
 * 用户相关动作
 */
@Controller
public class UserAction implements ModelDriven<UserEntity> {
    // 使用UserService进行事务请求
    private final UserService userService;
    // Action所使用的数据实体
    private UserEntity userEntity = new UserEntity();
    private List<UserEntity> userEntityList = new ArrayList<>();

    @Autowired
    public UserAction(UserService userService) {
        this.userService = userService;
    }

    // 添加用户
    public String createUser() throws Exception {
        // 保存
        userEntity.setCreateTime(new Timestamp(System.currentTimeMillis()));
        userService.createUser(userEntity);
        // 刷新列表
        userEntityList = null;
        userEntityList = userService.listUser();
        return SUCCESS;
    }

    // 列举用户
    public String listUser() throws Exception {
        userEntityList = userService.listUser();
        return SUCCESS;
    }

    @Override
    public UserEntity getModel() {
        return userEntity;
    }

    public List<UserEntity> getUserEntityList() {
        return userEntityList;
    }

    public void setUserEntityList(List<UserEntity> userEntityList) {
        this.userEntityList = userEntityList;
    }
}
