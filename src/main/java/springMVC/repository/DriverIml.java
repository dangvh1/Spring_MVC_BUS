package springMVC.repository;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import springMVC.entity.Driver;
import springMVC.util.HibernateUtil;

import java.util.List;

@Repository
public class DriverIml {

    Logger logger = Logger.getLogger(DriverIml.class);

    public List<Driver> getAllDriver() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Driver ").list();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Driver getDriverbyID(int id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Driver driver=null;
        try {
            session.beginTransaction();
            driver = session.load(Driver.class, id);
            session.getTransaction().commit();
            return driver;
        } catch (Exception e) {
            session.getTransaction().rollback();
        }
        return driver;
    }
    public Driver getDriverbyName(String name){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Driver driver=null;
        try {
            session.beginTransaction();
            driver = session.load(Driver.class, name);
            session.getTransaction().commit();
            return driver;
        } catch (Exception e) {
            session.getTransaction().rollback();
        }
        return driver;
    }


    public boolean insertDriver(Driver driver) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.save(driver);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeDriver(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Query<Driver> query = session.createQuery("from Driver where id = :p_driver_id");
            query.setParameter("p_driver_id", id);
            Driver driver = query.getSingleResult();
            session.delete(driver);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            logger.error(e);
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }

    public boolean updateDriver(Driver driver) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.update(driver);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            logger.error(e);
        }
        return false;
    }
}
