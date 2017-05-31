package org.gitshu.user.action;

import org.gitshu.entity.UserEntity;
import org.gitshu.user.service.UserService;
import org.gitshu.utils.action.ActionVariableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by Pealing on 2017/5/29.
 * 修改用户类型
 */
@Controller
public class UserTypeUpdate extends ActionVariableSupport {
    // 使用UserService进行事务请求
    private final UserService userService;

    @Autowired
    public UserTypeUpdate(UserService userService) {
        this.userService = userService;
    }

    public String execute() {
        String username = httpServletRequest.getParameter("username");
        int userType = Integer.parseInt(httpServletRequest.getParameter("userType"));
        UserEntity userEntity = userService.getByUsername(username);
        userEntity.setUserType(userType);
        userService.update(userEntity);
        return SUCCESS;
    }
}
