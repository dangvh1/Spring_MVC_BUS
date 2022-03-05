package springMVC.repository;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;


import springMVC.entity.DriverAssignment;
import springMVC.util.HibernateUtil;

public class AssignmentIml {

    Logger logger = Logger.getLogger(AssignmentIml.class);


    public DriverAssignment findById(int driverId,int buslineId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        DriverAssignment driverAssignment = null;
        try {
            session.beginTransaction();
            Query<DriverAssignment> query = session.createNativeQuery(
                    "SELECT * FROM ASSIGNMENT WHERE DRIVER_ID = :p_driver_id and BUSLINE_ID = :p_busline_id"
                    , DriverAssignment.class);
            query.setParameter("p_driver_id", driverId);
            query.setParameter("p_busline_id", buslineId);
            driverAssignment = query.getSingleResult();
            session.getTransaction().commit();
            return driverAssignment;
        } catch (Exception e) {
            session.getTransaction().rollback();
        }
        return driverAssignment;
    }



    public boolean assignment(DriverAssignment driverAssignment) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.update(driverAssignment);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            logger.error(e);
        }
        return false;
    }
}
