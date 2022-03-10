package springMVC.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import springMVC.entity.Driver;
import springMVC.repository.DriverIml;

import java.util.List;

@Service
public class DriverService {
    @Autowired
    DriverIml driverIml;

    public List<Driver> getListDriver() {
        return driverIml.getAllDriver();
    }

    public boolean insertDriver(Driver driver) {
        return driverIml.insertDriver(driver);
    }
    public boolean removeDriver(int id){
        return  driverIml.removeDriver(id);
    }

    public boolean updateDriver(Driver driver) {
        return driverIml.updateDriver(driver);
    }

    public Driver getById(int id){
        return driverIml.getDriverbyID(id);
    }
    public Driver findByName(String name){
        return driverIml.getDriverbyName(name);
    }
}
