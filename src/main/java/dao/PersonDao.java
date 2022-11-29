package dao;

import model.Person;

import java.util.List;

public interface PersonDao {
    String save(Person person);

    String update(Person person);

    String delete(String id);

    Person findById(String id);

    List<Person> findByName(String name);

    List<Person> findAll();
}
