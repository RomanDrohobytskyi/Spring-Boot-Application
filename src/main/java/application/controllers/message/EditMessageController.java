package application.controllers.message;

import application.entities.message.Message;
import application.menu.MenuTabs;
import application.services.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/editMessage")
public class EditMessageController {

    @Autowired
    private MessageService messageService;

    @GetMapping("{message}")
    @PreAuthorize("hasAuthority('USER')")
    public String getEditForm(@PathVariable Message message, Model model){
        model.addAttribute("message", message);
        model.addAttribute("menuElements", new MenuTabs().defaultMenu());
        model.addAttribute("slideMenuElements", new MenuTabs().defaultSlideMenu());
        return "editMessage";
    }

    @PostMapping
    public String saveEditedMessage(
            @RequestParam String text,
            @RequestParam String tag,
            @RequestParam("file") MultipartFile file,
            @RequestParam("messageId") Message message) {
        messageService.adaptEditedMessage(message, text, tag, file);
        return "redirect:/main#message_" + message.getId();
    }

    @GetMapping("/cancel")
    public String cancel(){
        return  "redirect:/main#messagesTable";
    }

}