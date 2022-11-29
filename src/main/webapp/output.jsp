<%@ page import="model.Person" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.impl.PersonDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.: Data Member :.</title>
    </head>
    <body bgcolor="#2face6">
            <%! List<Person> data = new ArrayList<Person>();
            %>
            <% try {
                System.out.println("Data 1: "+data.toString());
                Person person = new Person();
                person.setId(request.getParameter("id"));
                person.setName(request.getParameter("name"));
                person.setAddress(request.getParameter("address"));
                person.setGender(request.getParameter("gender"));
                data.add(person);
                System.out.println("Data 2: "+data.toString());
                PersonDaoImpl personDaoImpl = new PersonDaoImpl();
                String result = personDaoImpl.save(person);
                System.out.println(result);
                    if (result.equalsIgnoreCase("success")) {
                        List<Person> listAll = personDaoImpl.findAll();
                        if(listAll.isEmpty()){
                            System.out.println("Data Not Found");
                        }
                    %>
                        <center><h1>SUCCESS INPUT</h1>
                    <%
                    } else if (result.equalsIgnoreCase("failed")) {
                    %>
                            <center><h1>FAILED INPUT !!!</h1>
                    <%
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
                %>
    <center>
        <table>
            <tr>
                <th bgcolor="Blue" colspan="8"><h1 style="color:white"> .: Data Member :.</h1></th>
            </tr>
            <tr>
                <td> Id Member </td>
                <td> Name </td>
                <td> Address </td>
                <td> Gender </td>
            </tr>
            <%
                try {
                    System.out.println("Data 3: "+data.toString());
                    for (Person person : data) {
                        out.print("<tr>"
                                + "<td>" + person.getId() + "</td>"
                                + "<td>" + person.getName() + "</td>"
                                + "<td>" + person.getAddress() + "</td>"
                                + "<td>" + person.getGender() + "</td>"
                                + "</tr>");
                    }
                } catch (Exception e) {
                }
            %>
        </table>
        <br>
        <font>
        <a href="registration.jsp"><input type="button" value="Back To Menu"></a>
        </font>
    </center>

</body>
</html>
