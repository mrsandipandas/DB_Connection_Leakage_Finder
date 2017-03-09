<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title><bean:message key="aapl.proj.title"></bean:message></title>
    <script type="text/javascript">
    <!--
    function validateLoginFields()
    {
            var uid = document.getElementsByName("userName");
            var pwd = document.getElementsByName("password");
            
            /*if((uid[0].value).length == 0 || (pwd[0].value).length == 0)
            {
                    alert("Please enter User Name and Password");
                    return false;
            }*/
            return true;	
    }
    function validateDebugUser()
    {
        var password = prompt("Please enter debug mode password.", "Enter password");
        if(password=='debug')
        {
            return true;
        }
        else
        {
            alert('The password you entered is incorrect');
            return false;
        }
    }
    //-->
    </script>
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath() %>/resources/css/commonStyle.css" />
    
    <c:set var="logout_error_message" value="logout.error.message" />
	<c:set var="errorMessage" value="${requestScope[logout_error_message]}" />
    <!--Google analytics-->
    <script type="text/javascript">

          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', 'UA-19207433-1']);
          _gaq.push(['_trackPageview']);

          (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
          })();

    </script>
    <!--//////////////////////////////////////////////////////////////-->  
  </head>
  <body> 
  	<br/>
  	<br/>
  	<br/>
  	<br/>
  	<br/>
  	<br/>
   <div style="width:759px;margin:0px auto;border:0px solid red;" align="center">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
      <c:if test="${errorMessage != null}">
	      <tr>
	        <th align="left" valign="top" class="errosMessage" style="padding-left:30%;"><c:out value="${errorMessages}"></c:out></th>
	      </tr>
      </c:if>
      <!-- <tr>
        <th align="left" valign="top" class="fontSectionHeader" style="padding-left:30%;"><bean:message key="header.login"></bean:message></th>
      </tr>-->      
      <tr>
      	<td style="width:393px; heiht:268px">
      		<img width="393px" height="268px" src="<%=request.getContextPath() %>/resources/images/login_left.jpg"></img>
      	</td>
        <td background="<%=request.getContextPath() %>/resources/images/login_right.jpg" style="width: 366px; height: 268px;">			
                    <html:form action="/login.do" method="post" onsubmit="return validateLoginFields()">                   
                            <table>
                            	<%
                            	String loginError = (String)request.getAttribute("LOGIN_ERROR");
                            	if(loginError!=null && loginError.length()>0) {
                            	%>
                            	<tr>
                            		<td colspan="2" align="right" height="30px">
                            			<font color="red" face="bold" size="3"><%=loginError %></font>
                            		</td>
                            	</tr>
                            	<%} %>
                              <tr>
                                    <td width="40%" align="right" class="fontRegular"><font color="#ffffff"><bean:message key="label.login.username"></bean:message></font></td>
                                    <td width="60%" align="left" >
                                            <html:text property="userName" styleClass="loginInput" size="25" maxlength="30"></html:text>
                                    </td>
                              </tr>
                              <tr>
                                    <td align="right" valign="middle" class="fontRegular"><font color="#ffffff"><bean:message key="label.login.password"></bean:message></font></td>
                                    <td align="left" valign="top">
                                            <input type="password" name="password" class="loginInput" size="25" maxlength="30"/>
                                    </td>
                              </tr>
                              <tr>
                              		<td>&nbsp;</td>
                                    <td align="left">
                                      <html:submit styleClass="bodyButton"><bean:message key="header.login"></bean:message></html:submit>
                                      &nbsp;&nbsp;&nbsp;<html:reset  styleClass="bodyButton"><bean:message key="label.button.clear"></bean:message></html:reset>
                                    </td>
                              </tr>
                            </table>
                    </html:form>
            </td>
      </tr>
       <!--This portion of the code is for debug of the leaked connection-->
        <A HREF="<%=request.getContextPath()%>/jsp/login/LeakedConnection.jsp" target="_blank" onclick="return validateDebugUser()">.</A>
        <!--This portion of the code is for debug of the leaked connection Ends Here-->
    </table>
    </div>
  </body>
</html>