package org.excalibur.sample.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.crypto.hash.DefaultHashService;
import org.apache.shiro.crypto.hash.HashRequest;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.excalibur.sample.core.domain.User;
import org.excalibur.sample.core.exception.RegisterException;
import org.excalibur.sample.dao.UserRepository;
import org.excalibur.sample.service.UserService;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

/**
 * Created by excalibur on 2014/6/28.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DefaultHashService defaultHashService;

    @Override
    public void register(User user)throws RegisterException {
        user.setRegisteTime(new DateTime());

        if (StringUtils.isBlank(user.getUsername())) {
            throw new RegisterException("user username can't be or have blank!");
        }

        if (StringUtils.isBlank(user.getPassword())) {
            throw new RegisterException("user password can't be or have blank!");
        }

        // 密码加密

        // 注册后续逻辑
        userRepository.save(user);
    }

}
