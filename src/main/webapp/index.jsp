<%@ page import="dao.impl.PersonDaoImpl" %>
<%@ page import="model.Person" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<center>
<%--    sampe method 1 for testing add--%>
<%--    <a href="registration.jsp"><input type="button" value="input data" /></a>--%>

    <%
    try {
            PersonDaoImpl personDaoImpl = new PersonDaoImpl();
            List<Person> personList=new ArrayList<Person>();
            String field = request.getParameter("field");
            String value = request.getParameter("value");
            int sum = 0;
            if (value == null) {
                personList = personDaoImpl.findAll();
            } else {
                personList = personDaoImpl.finByFieldValue(field, value);
            }
    %>
    <h1> .: Hibernate Project With server Glassfish :.</h1>
    <center>
        <br>
        <form name="search" method="post" action="index.jsp">
            <table>
                <tr>
                    <td>Find By</td>
                    <td>:</td>
                    <td>
                        <select name="field" required="required">
                            <option selected="selected" disabled="disabled" value="">field</option>
                            <option value="id">Id</option>
                            <option value="name">Name</option>
                            <option value="address">Address</option>
                            <option value="gender">Gender</option>
                        </select>
                    </td>
                    <td><input type="text" name="value" size="12" ></td>
                    <td><input type="submit" value="find"></td>
                </tr>
            </table>
        </form>
        <br>
        <table border="1">
            <tr>
                <th colspan="6">.: Data All Person :.</th>
            </tr>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Address</th>
                <th>Gender</th>
                <th colspan="2"><a href="module.jsp?action=add">Add</a></th>
            </tr>
            <% for (Person person : personList) {
                 sum++;
            %>
            <tr>
                <td><%=person.getId()%></td>
                <td><%=person.getName()%></td>
                <td><%=person.getAddress()%></td>
                <td><%=person.getGender()%></td>
                <td><a href="module.jsp?action=update&Id=<%=person.getId()%>">Update</a></td>
                <td><a href="proses.jsp?action=delete&Id=<%=person.getId()%>" onclick="return confirm('Are you sure')">Delete</a></td>
            </tr>
            <% }
                if (sum == 0) {
            %>
            <tr>
                <th colspan="6">Data is Empty</th>
            </tr>
            <%  }
            } catch (Exception e) {
            out.println("error" + e);
            }
        %>
        </table>
</body>
</html>