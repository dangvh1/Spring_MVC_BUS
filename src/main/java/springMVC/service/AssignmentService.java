package springMVC.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import springMVC.entity.Assignment;
import springMVC.entity.Driver;
import springMVC.repository.AssignmentIml;

import java.util.List;

@Service
public class AssignmentService {
    @Autowired
    AssignmentIml assignmentIml;

    public String add(Assignment assignment) {
        assignmentIml.addAssignment(assignment);
        return "success";
    }
    public List<Assignment> getAll() {
        return assignmentIml.getAll();
    }

    public String assignmentDriver(Assignment assignment) {
        if(assignment.getBusLineSum() <= 15){
            assignmentIml.addAssignment(assignment);
            return "success";

        }else {
            return " So luot di khong qua 15 luot";
        }
    }
    public boolean updateAssignment(Assignment assignment) {
        return assignmentIml.update(assignment);
    }
    public void removeAssignment(int id){
        assignmentIml.delete(id);
    }
    public Assignment getById(int id){
        return assignmentIml.findById(id);
    }




}
