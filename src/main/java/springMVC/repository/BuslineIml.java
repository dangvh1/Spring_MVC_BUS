package springMVC.repository;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import springMVC.entity.Busline;
import springMVC.entity.Driver;
import springMVC.util.HibernateUtil;

import java.util.List;

@Repository
public class BuslineIml {
    Logger logger = Logger.getLogger(BuslineIml.class);

    public List<Busline> getAllBusline() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Busline ").list();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Busline getBuslineID(int id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Busline busline =null;
        try {
            session.beginTransaction();
            busline = session.load(Busline.class, id);
            session.getTransaction().commit();
            return busline;
        } catch (Exception e) {
            session.getTransaction().rollback();
        }
        return busline;
    }
    public Busline getBuslinebyName(String name){
        try (Session session = HibernateUtil.getSessionFactory().openSession()){
            session.beginTransaction();
            Query<Busline> query = session.createQuery("from Busline where buslineName = :p_busline_name");
            query.setParameter("p_busline_name", name);
            Busline busline = query.getSingleResult();
            session.getTransaction().commit();
            return busline;
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e);
        }
        return null;
    }


    public boolean insertBusline(Busline busline) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.save(busline);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeBusline(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Query<Busline> query = session.createQuery("from Busline where id = :p_busline_id");
            query.setParameter("p_busline_id", id);
            Busline busline = query.getSingleResult();
            session.delete(busline);
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

    public boolean updateBusline(Busline busline) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.update(busline);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            logger.error(e);
        }
        return false;
    }
}
