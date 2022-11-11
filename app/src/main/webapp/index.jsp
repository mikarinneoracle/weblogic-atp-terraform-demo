<%@ page import="example.Atp" %>

<%
    String res = Atp.runsql();
%>

<h2>Welcome to WebLogic with Terraform on OCI</h2>

ATP query result for date and time: <b><%= res %></b>

