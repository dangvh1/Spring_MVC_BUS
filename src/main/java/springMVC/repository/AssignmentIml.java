package springMVC.repository;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;


import org.springframework.stereotype.Repository;
import springMVC.entity.Assignment;
import springMVC.entity.Driver;
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
    public boolean update(Assignment assignment) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            System.out.println(assignment);
            session.beginTransaction();
            session.update(assignment);
            session.getTransaction().commit();
            System.out.println("true");
            return true;
        } catch (HibernateException e) {
            logger.error(e);
        }
        System.out.println("false");
        return false;
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

    public Assignment findById (int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Assignment assignment = null;
        try {
            session.beginTransaction();
            assignment = session.load(Assignment.class, id);
            session.getTransaction().commit();
            return assignment;
        } catch (Exception e) {
            session.getTransaction().rollback();
        }
        return assignment;
    }

}
