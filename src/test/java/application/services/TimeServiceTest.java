package application.services;

import application.entities.time.data.Time;
import application.enums.State;
import application.repositories.IAimRepository;
import application.repositories.ITimeRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.*;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(SpringExtension.class)
@SpringBootTest
class TimeServiceTest {

    @Mock
    private IAimRepository aimRepository;
    @Mock
    private ITimeRepository timeRepository;
    @InjectMocks
    private TimeService timeService;
    private List<Time> times;

    @BeforeEach
    void init(){
        times = new ArrayList<>(Arrays.asList(
                timeService.adaptTime(new Double("2"), new Date(), "Test Time object 1", State.DateState.NEW, null),
                timeService.adaptTime(new Double("3.5"), new Date(), "Test Time object 2", State.DateState.NEW, null)
        ));
        times.get(0).setId(1L);
        times.get(1).setId(2L);
    }

    @Test
    void saveAll(){
        timeService.saveAll(times);
        assertNotNull(times);
        assertAll("Assert ids not null",
                () -> assertTrue(times.size() == 2),
                () -> assertNotNull(times.get(0)),
                () -> assertNotNull(times.get(1)),
                () -> assertNotNull(times.get(0).getId()),
                () -> assertNotNull(times.get(0).getId()));
    }

    @Test
    void shouldCreateArticle() {
        times = new ArrayList<>(Arrays.asList(
                timeService.adaptTime(new Double("2"), new Date(), "Test Time object 1", State.DateState.NEW, null),
                timeService.adaptTime(new Double("3.5"), new Date(), "Test Time object 2", State.DateState.NEW, null)
        ));
        times.get(0).setId(1L);
        times.get(1).setId(2L);
    }

    @Test
    void adaptTime() {
        Time time = timeService.adaptTime(new Double("2.5"), new Date(), "Test Time object", State.DateState.NEW, null);
        assertNotNull(time, "Object Time is NULL in adaptTime() test.");
        assertAll("time",
                () -> assertEquals(new Double("2.5"), time.getTime()),
                () -> assertEquals("Test Time object", time.getDescription()),
                () -> assertEquals(State.DateState.NEW.toString(), time.getState()),
                () -> assertNull(time.getAim())
        );
    }

    @Test
    void getAimLoggedTimeSum(){
        assertEquals(new Double("5.5"), timeService.getAimLoggedTimeSum(new HashSet<>(times)));
    }

    @Test
    void getMostActiveTime(){
        Time mostActive = timeService.getMostActiveTime(new HashSet<>(times))
                .orElseThrow(IllegalArgumentException :: new);
        assertEquals(mostActive.getId(), Long.valueOf(2));
    }

    @Test
    void getLessActiveTime(){
        Time lessActive = timeService.getLessActiveTime(new HashSet<>(times));
        assertEquals(lessActive.getId(), Long.valueOf(1));
    }


}
