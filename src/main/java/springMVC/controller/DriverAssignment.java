package springMVC.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import springMVC.DTO.AssignmentDTO;
import springMVC.entity.Assignment;
import springMVC.entity.Driver;
import springMVC.service.AssignmentService;
import springMVC.service.BuslineService;
import springMVC.service.DriverService;

import java.util.Objects;

@Controller
@RequestMapping("/")
public class DriverAssignment {
    @Autowired
    private DriverService driverService;

    @Autowired
    private BuslineService buslineService;

    @Autowired
    AssignmentService assignmentService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView HOME() {
        return new ModelAndView("driver-assignment-home", "command", new DriverAssignment());
    }

    @RequestMapping(value = "/driver-assignment", method = RequestMethod.GET)
    public String viewAssignment( ModelMap modelMap) {
        modelMap.put("driverAssignment", assignmentService.getAll());
        return "assignment-list-full";
    }

    @RequestMapping(value = "/assignment-list", method = RequestMethod.GET)
    public String getListDriver(ModelMap modelMap) {
        modelMap.put("assignments",driverService.getListDriver());
        return "assignment-list";
    }

    @RequestMapping(value = "/assignment-create/{id}", method = RequestMethod.GET)
    public String viewform(@PathVariable("id") int id, Model model) {
        model.addAttribute("assignmentDTO", new AssignmentDTO());
        model.addAttribute("driver", driverService.getById(id));
        model.addAttribute("buslines",buslineService.getListBusline());
        return "assignment-form";
    }
    @RequestMapping(value = "/assignment-create", method = RequestMethod.POST)
    public String viewAdd(@ModelAttribute("assignmentDTO") AssignmentDTO assignmentDTO) {
        Assignment assignment = new Assignment();
        assignment.setDriver(driverService.getById(assignmentDTO.getDriver_id()));
        assignment.setBusline(buslineService.getById(assignmentDTO.getBusline_id()));
        assignment.setBusLineSum(assignmentDTO.getBusLineSum());
        String message = assignmentService.assignmentDriver(assignment);
        System.out.println(message);
        if(Objects.equals(message, "success")){
            return "redirect:/driver-assignment";
        }
        return "redirect:/message"+"?message="+message;
    }

    @RequestMapping(value = "/update-assignment/{id}", method = RequestMethod.GET)
    public ModelAndView viewUpdate(@PathVariable("id") int id, Model model) {
        Assignment assignment = assignmentService.getById(id);
        model.addAttribute("buslines",buslineService.getListBusline());
        return new ModelAndView("assignment-form-update", "command", assignment);
    }

    @RequestMapping(value = "/update-assignment/{id}", method = RequestMethod.POST)
    public String updateAssignment(@ModelAttribute("command") Assignment assignment, ModelMap modelMap) {
        if (assignmentService.updateAssignment(assignment)) {
            return "redirect:/driver-assignment";
        }
        modelMap.addAttribute("updateFail", true);
        return "redirect:/";
    }

    @RequestMapping(value = "/remove-assignment/{id}", method = RequestMethod.GET)
    public String deleteAssignment(@PathVariable("id") int id) {
        assignmentService.removeAssignment(id);
        return "redirect:/driver-assignment";
    }

    @RequestMapping(value = "/message", method = RequestMethod.GET)
    public String showResponse(@RequestParam String message,ModelMap model) {
        model.put("message", message);
        return "message";
    }

}
