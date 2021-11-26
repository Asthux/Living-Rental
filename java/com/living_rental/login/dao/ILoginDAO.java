package com.living_rental.login.dao;

import com.living_rental.manage.dto.LoginDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface ILoginDAO {
    public LoginDTO loginProc(LoginDTO login);
}
