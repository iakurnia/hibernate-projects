<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="util.HibernateUtils" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="model.Person" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.impl.PersonDaoImpl" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <center>
        <body>
            <%
                String action = request.getParameter("action");
                String id = request.getParameter("Id");
                if (action.contains("add")) {
            %>
            <form method="post" action="proses.jsp?action=insert">
                <table border="1" cellpadding="2">
                    <tr>
                        <th colspan="3"><h2>Regristration Member</h2></th>
                    </tr>
                    <tr>
                        <td>Id Member </td>
                        <td>:</td>
                        <td><input type="text" name="id" required="required"></td>
                    </tr>
                    <tr>
                        <td>Name </td>
                        <td>:</td>
                        <td><input type="text" name="name" required="required"></td>
                    </tr>
                    <tr>
                        <td>Address/Country </td>
                        <td>:</td>
                        <td><input type="text" name="address" required="required"></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>:</td>
                        <td><input type="radio" name="gender" value="male">Male
                            <input type="radio" name="gender" value="female">Female</td>
                    </tr>
                    <tr>
                        <td colspan="3" align="right" >
                            <input type="submit" value="Register">
                            <a href="index.jsp"><input type="button" value="Back" /></a>
                        </td>
                    </tr>
                </table>
            </form>
            <% } else if (action.contains("update")) {
                PersonDaoImpl personDaoImpl = new PersonDaoImpl();
                Person p = personDaoImpl.findById(id);
            %>
            <form method="post" action="proses.jsp?action=updt">
                <table border="1" cellpadding="2">
                    <tr>
                        <th colspan="3"><h2>Update Member</h2></th>
                    </tr>
                    <tr>
                        <td>Id</td>
                        <td>:</td>
                        <td><input type="text" name="id" readonly="readonly" value="<%=p.getId() %>"></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td>:</td>
                        <td><input type="text" name="name" required="required" value="<%=p.getName() %>"></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>:</td>
                        <td><input type="text" name="address" required="required" value="<%=p.getAddress() %>"></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>:</td>
                        <td><input type="radio" name="gender" value="male">Male
                            <input type="radio" name="gender" value="female">Female</td>
                    </tr>
                    <tr>
                        <th colspan="3">
                            <input type="submit" value="Update" />
                            <a href="index.jsp"><input type="button" value="back" /></a>
                        </th>
                    </tr>
                </table>
            </form>
            <%
                }
            %>
        </body>
</html>
