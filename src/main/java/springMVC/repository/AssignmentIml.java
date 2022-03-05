package springMVC.repository;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import springMVC.entity.Driver;
import springMVC.entity.DriverAssignment;
import springMVC.util.HibernateUtil;

public class AssignmentIml {

    Logger logger = Logger.getLogger(AssignmentIml.class);



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
