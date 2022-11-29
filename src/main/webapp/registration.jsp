<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.: Form Registration :.</title>
        <%
            String collor = "#2face6";
        %>
    </head>
    <body bgcolor=<%= collor%>>
    <center>
        <form method="post" action="output.jsp">
            
            <table border="1" bgcolor="#7492e8">
                <tr>
                    <th bgcolor="Blue" colspan="3"><h2 style="color: white">Regristration Member</h2></th>
                </tr>
                <tr>
                    <td>Id Member </td>
                    <td>:</td>
                    <td><input type="text" name="id"></td>
                </tr>
                <tr>
                    <td>Name </td>
                    <td>:</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Address/Country </td>
                    <td>:</td>
                    <td><input type="text" name="address"></td>
                </tr>
                <%--<tr>
                    <td>Birth Day </td>
                    <td> : </td>
                    <td><select name="date">
                            <option disabled="disabled" selected="selected">Date</option>
                            <% for (int i = 1; i < 32; i++) {%>
                            <option><%=i%></option>
                            <%}%>                           
                        </select>
                        <select name="month">
                            <option disabled="disabled" selected="selected">Month</option>
                            <% String month[] = {"Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"};
                                for (int i = 0; i < 12; i++) {
                            %>
                            <option><%=month[i]%></option>
                            <%}%>
                        </select>
                        <select name="year">
                            <option disabled="disabled" selected="selected">Year</option>
                            <% for (int i = 1900; i <= 2013; i++) {%>
                            <option><%=i%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Type Member </td>
                    <td>:</td>
                    <td><select name="type">
                            <option disabled="disabled" selected="selected" value="Choose">Choose</option>
                            <option value="gold">Gold</option>
                            <option value="silver">Silver</option>
                            <option value="premium">Premium</option>
                        </select></td>
                </tr>--%>
                <tr>
                    <td>Gender</td>
                    <td>:</td>
                    <td><input type="radio" name="gender" value="male">Male
                        <input type="radio" name="gender" value="female">Female</td>
                </tr>
                <tr>
                    <td colspan="3" align="right" bgcolor="Blue"><input type="submit" value="Register"></td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
