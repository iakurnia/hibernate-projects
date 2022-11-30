package dao.impl;

import dao.PersonDao;
import model.Person;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtils;

import java.util.ArrayList;
import java.util.List;

public class PersonDaoImpl implements PersonDao {
    SessionFactory sessionFactory;
    Session session;

    public PersonDaoImpl() {
        if (!HibernateUtils.getSessionFactory().isClosed()) {
            HibernateUtils.ShutDown();
        }
    }

    private Query queryUpdate(Person person) {
        Query q = session.createQuery("Update Person set name=:name, address=:address, gender=:gender where id=:id");
        q.setParameter("id", person.getId());
        q.setParameter("name", person.getName());
        q.setParameter("address", person.getAddress());
        q.setParameter("gender", person.getGender());
        q.executeUpdate();
        return q;
    }

    @Override
    public String save(Person person) {
        System.out.println("Insert Data Person");
        String result = null;
        sessionFactory = HibernateUtils.getSessionFactory();
        try {
            session = sessionFactory.getCurrentSession();
            System.out.println("Transaction Begin");
            session.beginTransaction();
            session.save(person);
            session.beginTransaction().commit();
            System.out.println("Transaction End");
            result = "success";
        } catch (Exception ex) {
            result = "failed";
            ex.printStackTrace();
        }
        System.out.println("Inset Data Person with name  " + person.getName() + " saved");
        return result;
    }

    @Override
    public String update(Person person) {
        String result = null;
        sessionFactory = HibernateUtils.getSessionFactory();
        int temResult = 0;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction().begin();
            Query tQuery = queryUpdate(person);
            temResult = tQuery.executeUpdate();
            session.beginTransaction().commit();
            if (temResult > 0) {
                result = "success";
            } else {
                result = "failed";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        System.out.println("Update Data Person with name " + person.getName() + " updated");
        session.close();
        return result;
    }

    @Override
    public String delete(String id) {
        String result = "";
        sessionFactory = HibernateUtils.getSessionFactory();
        int tResult = 0;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction().begin();
            Query tQuery = session.createQuery("DELETE from Person where id=:id");
            tQuery.setParameter("id", id);
            tResult = tQuery.executeUpdate();
            session.beginTransaction().commit();
            if (tResult > 0) {
                result = "success";
            } else {
                result = "failed";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        System.out.println("Delete Data Person with id = " + id + " deleted");
        session.close();
        return result;
    }

    @Override
    public Person findById(String id) {
        Person person = null;
        sessionFactory = HibernateUtils.getSessionFactory();
        try {
            session = sessionFactory.getCurrentSession();
            session.beginTransaction();
            Query tQuery = session.createQuery("FROM Person WHERE id=:id");
            tQuery.setParameter("id", id);
            if (tQuery.list().size() > 0) {
                person = (Person) tQuery.list().get(0);
                System.out.println("Find Data Person with id= " + person.getId() + " found");
            }else{
                System.out.println("Data Not Found with id= "+id);
            }
            session.beginTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return person;
    }

    @Override
    public List<Person> findByName(String name) {
        List<Person> tListPerson = new ArrayList<Person>();
        sessionFactory = HibernateUtils.getSessionFactory();
        try {
            session = sessionFactory.getCurrentSession();
            session.beginTransaction();
            Query tQuery = session.createQuery("from Person where name='" + name+"'");
            if (tQuery.list().size() > 0) {
                tListPerson = tQuery.list();
                System.out.println("Data Person with name : " + name + " is " + tListPerson.size() + " found");
            }else{
                System.out.println("Data Not Found with name= "+name);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return tListPerson;
    }

    @Override
    public List<Person> findAll() {
        List<Person> tListPerson = new ArrayList<Person>();
        sessionFactory = HibernateUtils.getSessionFactory();
        session = sessionFactory.openSession();
        session.beginTransaction();
        Query tQuery = session.createQuery("from Person");
        if (tQuery.list().size() > 0) {
            tListPerson = tQuery.list();
            System.out.println("Data Person is " + tListPerson.size() + " found");
        }else{
            System.out.println("Data Not Found");
        }
        session.beginTransaction().commit();
        return tListPerson;
    }

    public List<Person> finByFieldValue(String field, String value) {
        List<Person> list = new ArrayList<Person>();
        sessionFactory = HibernateUtils.getSessionFactory();
        session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Person where " + field + " like :value");
        q.setParameter("value", "%" + value + "%");
        list = q.list();
        return list;
    }
}
