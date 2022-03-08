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

    public boolean assignmentDriver(Assignment assignment) {

        return assignmentIml.addAssignment(assignment);
    }
    public void updateDriver(Assignment assignment) {

        assignmentIml.update(assignment);
    }
    public void removeAssignment(int id){
        assignmentIml.delete(id);
    }




}
