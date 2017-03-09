<%--
  Created by IntelliJ IDEA.
  User: sakuh657
  Date: Dec 26, 2010
  Time: 8:27:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head><title>The Leaked Connections</title></head>
  <body>
    <%
        System.out.println("The number of open connections:");
        System.out.println("_____________________________________________________________________________");
        System.out.println(ro.kifs.diagnostic.Connection.getStillOpenedConnsStackTraces());
        out.println(ro.kifs.diagnostic.Connection.getStillOpenedConnsStackTraces());
        System.out.println("_____________________________________________________________________________");
    %>
  </body>
</html>