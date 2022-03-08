package springMVC.repository;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;


import org.springframework.stereotype.Repository;
import springMVC.entity.Assignment;
import springMVC.util.HibernateUtil;

import java.util.List;

@Repository
public class AssignmentIml {

    Logger logger = Logger.getLogger(AssignmentIml.class);

    public List<Assignment> getAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            return (List<Assignment>) session.createQuery("from Assignment").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addAssignment(Assignment assignment){
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.save(assignment);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return false;
    }
    public void update(Assignment assignment) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.update(assignment);
            session.getTransaction().commit();
        } catch (Exception exception) {
            exception.printStackTrace();
            assert session != null;
            session.getTransaction().rollback();
        }
    }
    public void delete(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
           Assignment assignment = (Assignment) session.load(Assignment.class, id) ;
            session.delete(assignment);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
        }
    }

    public Assignment findById(int driverId, int buslineId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Assignment driverAssignment = null;
        try {
            session.beginTransaction();
            Query<Assignment> query = session.createNativeQuery(
                    "SELECT * FROM ASSIGNMENT WHERE DRIVER_ID = :p_driver_id and BUSLINE_ID = :p_busline_id"
                    , Assignment.class);
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

}
