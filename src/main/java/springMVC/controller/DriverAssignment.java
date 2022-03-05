package springMVC.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import springMVC.entity.Driver;
import springMVC.service.DriverService;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/")
public class DriverAssignment {
    @Autowired
    private DriverService driverService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView student() {
        return new ModelAndView("driver-assignment", "command", new DriverAssignment());
    }

    @RequestMapping(value = "/assignment-list", method = RequestMethod.GET)
    public String getListDriver(ModelMap modelMap) {
        modelMap.put("assignments",driverService.getListDriver());
        return "assignment-list";
    }

    @RequestMapping(value = "/driver-assignment/{id}", method = RequestMethod.POST)
    public String updateDriver(@ModelAttribute("command") Driver driver, ModelMap modelMap) {
        if (driverService.updateDriver(driver)) {
            return "redirect:/driver-list";
        }
        modelMap.addAttribute("updateFail", true);
        return "redirect:/";
    }




}
