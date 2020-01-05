package application.controllers;

import application.entities.aim.TenThousandHoursAim;
import application.entities.user.User;
import application.managers.UserManager;
import application.repositories.ITenThousandHoursAimRepository;
import application.services.TenThousandHoursAimService;
import application.utils.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Controller
public class TenThousandHoursAimController {

    @Autowired
    private ITenThousandHoursAimRepository iTenThousandHoursAimRepository;
    private UserManager userManager = new UserManager();
    private TenThousandHoursAimService tenThousandHoursAimService = new TenThousandHoursAimService();

    @GetMapping("/ten_thousand_hours_aim")
    public String allAims(Model model){
        User loggedInUser = userManager.getLoggedInUser();
        Iterable<TenThousandHoursAim> userAims = iTenThousandHoursAimRepository.findByUser(loggedInUser);

        model.addAttribute("all_aims", userAims);
        return "ten_thousand_hours_aim";
    }

    @GetMapping("/ten_thousand_hours_aim/add")
    public String addAim(
            @AuthenticationPrincipal User user,
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam String text,
            Map<String, Object> model) {

        Optional<TenThousandHoursAim> aimOptional = tenThousandHoursAimService.adaptAim(title, description, text, user);
        if (aimOptional.isPresent()){
            TenThousandHoursAim aim = aimOptional.get();
            iTenThousandHoursAimRepository.save(aim);
            Iterable<TenThousandHoursAim> userAims = user.getTenThousandHoursAims();
            model.put("aims", userAims);
        }
        else {
            HashMap myMap = MapUtils.oneElementHashMap("", "");
            model.put("aims", myMap);
        }
        return "redirect:/ten_thousand_hours_aim#aimsTable";
    }

/*    @GetMapping("/main_aim/delete/{aim}")
    public String deleteMessage(
            @PathVariable Aim aim,
            Map<String, Object> model) {

        aimService.deleteAim(aim);
        User loggedInUser = userManager.getLoggedInUser();
        Iterable<Aim> userAims = aimRepository.findByUser(loggedInUser);

        model.put("aims", userAims);

        return "redirect:/main_aim#aimsTable";
    }*/

}
