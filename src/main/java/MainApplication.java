import dao.impl.PersonDaoImpl;
import model.Person;

import java.util.List;

public class MainApplication {
    public static void main(String[] args) {
        save();
        update();
        delete();
        findById();
        findByName();
        findAll();
    }

    public static void save(){
        PersonDaoImpl personDaoImpl = new PersonDaoImpl();
        Person person = new Person();
        person.setId("P001");
        person.setName("Ia Kurnia");
        person.setAddress("Indonesia");
        person.setGender("Male");
        personDaoImpl.save(person);
    }
    public static void update(){
        PersonDaoImpl personDao=new PersonDaoImpl();
        Person person = new Person();
        person.setId("P001");
        person.setName("Ia Kurnia Update");
        person.setAddress("Indonesia Update");
        person.setGender("Male Update");
        personDao.update(person);
    }
    public static void delete(){
        PersonDaoImpl personDao= new PersonDaoImpl();
        Person person = new Person();
        person.setId("P001");
        personDao.delete(person.getId());
    }
    public static void findById(){
        PersonDaoImpl personDao= new PersonDaoImpl();
        Person person = new Person();
        person.setId("P001");
        person = personDao.findById(person.getId());
        if(person != null){
            System.out.println(person.toString());
        }
    }
    public static void findByName(){
        PersonDaoImpl personDao= new PersonDaoImpl();
        List<Person> listName = personDao.findByName("Ia Kurnia");
        for (Person p:listName) {
            System.out.println(p.toString());
        }
    }
    public static void findAll(){
        PersonDaoImpl personDao= new PersonDaoImpl();
        List<Person> listAll = personDao.findAll();
        for (Person p:listAll) {
            System.out.println(p.toString());
        }
    }
}
