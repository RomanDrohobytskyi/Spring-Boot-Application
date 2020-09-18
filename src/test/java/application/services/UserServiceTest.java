package application.services;

import application.entities.user.User;
import application.repositories.IUserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(SpringExtension.class)
@SpringBootTest
class UserServiceTest {

    @Mock
    private IUserRepository userRepository;
    @Mock
    private MailSenderService mailSenderService;
    @Mock
    private PasswordEncoder passwordEncoder;
    @InjectMocks
    private UserService userService;
    private User user;

    @BeforeEach
    void createUser(){
        this.user = new User();
    }

    @Test
    void userServiceIsNotNull(){
        assertNotNull(userService);
    }

    @Test
    void validateRegistrationEmptyEmail(){
        user.setEmail("");

        Map<String, Object> validationResult = userService.validateUserRegistrationData(user, null);

        assertTrue(validationResult.containsKey("emailIsEmpty"));
    }

    @Test
    void validateRegistrationPasswordNotMach (){
        user.setEmail("someRandomUniqueEmailAddress@test.test");
        user.setPassword("111");
        String confirmationPassword = "222";
        Map<String, Object> validationResult = userService.validateUserRegistrationData(user, confirmationPassword);

        assertTrue(validationResult.containsKey("passwordNotMach"));
    }

    @Test
    void notEmptyEmailTest(){
        user.setEmail("non empty");
        assertFalse(userService.isUserEmailEmpty(user));
    }

    @Test
    void emptyEmailTest(){
        user.setEmail("");
        assertTrue(userService.isUserEmailEmpty(user));
    }


}