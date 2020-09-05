package application.services;

import application.entities.aim.TenThousandHoursAim;
import application.entities.user.User;
import application.enums.State;
import application.managers.UserManager;
import application.repositories.ITenThousandHoursAimRepository;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TenThousandHoursAimService {

    private final ITenThousandHoursAimRepository aimRepository;
    private final UserManager userManager = new UserManager();

    public Optional<TenThousandHoursAim> createAim(String title, String description, String text, User user){
        Optional<TenThousandHoursAim> aimOptional = adaptAim(title, description, text, user);
        aimOptional.ifPresent(aimRepository::save);
        return aimOptional;
    }

    public Optional<TenThousandHoursAim> adaptAim(String title, String description, String text, User user) {
        if (Strings.isNotEmpty(title) && Strings.isNotEmpty(description) && user != null){
            TenThousandHoursAim aim = new TenThousandHoursAim();
            aim.setTitle(title);
            aim.setDescription(description);
            aim.setText(text);
            aim.setCreationDate(new Date());
            aim.setUser(user);
            return Optional.of(aim);
        }
        return Optional.empty();
    }

    public TenThousandHoursAim adaptEditedAim(TenThousandHoursAim aim, String title, String text, String description) {
        aim.setTitle(title);
        aim.setDescription(description);
        aim.setText(text);
        aim.setModificationDate(new Date());
        aim.setAimState(State.AimState.EDITED.toString());
        aimRepository.save(aim);
        return aim;
    }

    public TenThousandHoursAim deleteAim(TenThousandHoursAim aim) {
        aim.setModificationDate(new Date());
        aim.setDeletionDate(new Date());
        aim.setAimState(State.AimState.DELETED.toString());
        return aimRepository.save(aim);
    }

    public void delete(List<TenThousandHoursAim> aims){
        for (TenThousandHoursAim aim : aims){
            if (!aim.getAimState().equals(State.AimState.DELETED.toString())){
                deleteAim(aim);
            }
        }
    }

    public TenThousandHoursAim achieve(TenThousandHoursAim aim){
        aim.setAimState(State.AimState.ACHIEVED.toString());
        aim.setModificationDate(new Date());
        aim.setAchievedDate(new Date());
        return aimRepository.save(aim);
    }

    public List<TenThousandHoursAim> getAllLoggedUserAims(){
        User loggedInUser = userManager.getLoggedInUser();
        return aimRepository.findByUser(loggedInUser);
    }

    public List<TenThousandHoursAim> getAchievedUserAims(User user){
        return aimRepository.findTenThousandHoursAimsByAimStateAndUser(State.AimState.ACHIEVED.toString(), user);
    }

    public List<TenThousandHoursAim> getNotDeletedUserAims(User user) {
        return aimRepository.findAimsByAimStateIsNotLikeAndUser(State.AimState.DELETED.toString(), user);
    }
}
