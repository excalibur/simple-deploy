package org.excalibur.sample.service;

import org.excalibur.sample.core.domain.User;
import org.excalibur.sample.core.exception.RegisterException;

/**
 * Created by excalibur on 2014/6/28.
 */
public interface UserService {

    void register(User user)throws RegisterException;
}
