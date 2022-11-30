<%@ page import="model.Person" %>
<%@ page import="dao.impl.PersonDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.HibernateUtils" %>
<%@ page import="org.hibernate.Query" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Person person = new Person();
            PersonDaoImpl personDaoImpl = new PersonDaoImpl();
            String result = "";
            person.setId(request.getParameter("id"));
            person.setName(request.getParameter("name"));
            person.setAddress(request.getParameter("address"));
            person.setGender(request.getParameter("gender"));

            String id = request.getParameter("Id");
            String action = request.getParameter("action");
            if (action.contains("insert")) {
                try {
                    if(personDaoImpl.findById(request.getParameter("id")) !=null){
                        System.out.println("Data Already Exist !!");
                    }else{
                        result = personDaoImpl.save(person);
                        response.sendRedirect("index.jsp");
                    }
                } catch (Exception e) {
                    System.out.println("error" + e);
                }
            } else if (action.contains("updt")) {
                try {
                    result = personDaoImpl.update(person);
                    response.sendRedirect("index.jsp");
                } catch (Exception e) {
                    System.out.println("error" + e);
                }
            } else if (action.contains("delete")) {
                try {
                    result=personDaoImpl.delete(id);
                    response.sendRedirect("index.jsp");
                } catch (Exception e) {
                    System.out.println("error" + e);
                }
            }
        %>
    </body>
</html>
