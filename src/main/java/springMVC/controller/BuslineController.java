package springMVC.controller;
import org.springframework.web.bind.annotation.*;
import springMVC.entity.Busline;
import springMVC.entity.Driver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import springMVC.service.BuslineService;



import java.util.HashMap;
import java.util.Map;

@Controller
public class BuslineController {
    @Autowired
    private BuslineService buslineService;

    @RequestMapping(value = "/buslines", method = RequestMethod.GET)
    public ModelAndView busline() {
        return new ModelAndView("busline-form", "command", new Busline());
    }

    @RequestMapping(value = "/busline", method = RequestMethod.POST)
    public String addNewBusline(@ModelAttribute("command") Busline busline, ModelMap modelMap) {
        if (buslineService.insertBusline(busline)) {
            return "redirect:busline-list";
        }
        modelMap.addAttribute("insertFail", true);
        return "redirect:/";
    }

    @RequestMapping(value = "/busline-list", method = RequestMethod.GET)
    public String getListBusline(ModelMap modelMap) {
        modelMap.put("buslines", buslineService.getListBusline());
        return "busline-list";
    }

    @GetMapping(value = "/busline-remove/{id}")
    public String removeBusline(@PathVariable("id") int id, ModelMap modelMap) {
        if (buslineService.removeBusline(id)) {
            return "redirect:/busline-list";
        }
        modelMap.addAttribute("removeFail", true);
        return "redirect:/";
    }

    @RequestMapping(value = "/busline-update/{id}", method = RequestMethod.GET)
    public ModelAndView viewUpdateBusline(@PathVariable("id") int id) {
        Busline busline = buslineService.getById(id);
        return new ModelAndView("update-form-busline", "command", busline);
    }

    @RequestMapping(value = "/busline-update/{id}", method = RequestMethod.POST)
    public String updateBusline(@ModelAttribute("command") Busline busline, ModelMap modelMap) {
        if (buslineService.updateBusline(busline)) {
            return "redirect:/busline-list";
        }
        modelMap.addAttribute("updateFail", true);
        return "redirect:/";
    }
}
