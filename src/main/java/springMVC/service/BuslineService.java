package springMVC.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import springMVC.entity.Busline;
import springMVC.repository.BuslineIml;


import java.util.List;
@Service
public class BuslineService {
    @Autowired
    BuslineIml buslineDAO;

    public List<Busline> getListBusline() {
        return buslineDAO.getAllBusline();
    }

    public boolean insertBusline(Busline busline) {
        return buslineDAO.insertBusline(busline);
    }
    public boolean removeBusline(int id){
        return  buslineDAO.removeBusline(id);
    }

    public boolean updateBusline(Busline busline) {

        return buslineDAO.updateBusline(busline);
    }

    public Busline getById(int id){
        return buslineDAO.getBuslineID(id);
    }
}
