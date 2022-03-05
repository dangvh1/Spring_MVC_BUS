package springMVC.service;

import org.springframework.beans.factory.annotation.Autowired;
import springMVC.entity.Driver;
import springMVC.entity.DriverAssignment;
import springMVC.repository.AssignmentIml;

public class AssignmentService {
    @Autowired
    AssignmentIml assignmentIml;

    public boolean assignmentDriver(DriverAssignment driverAssignment) {

        return assignmentIml.assignment(driverAssignment);
    }


}
