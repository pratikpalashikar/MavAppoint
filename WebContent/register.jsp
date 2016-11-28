
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" import="uta.mav.appoint.captcha.*" %>
<jsp:include page="templates/header.jsp" />
<%
 String message = (String)session.getAttribute("message");
%>
<style>
.resize {
width: 60%;
}
.resize-body {
width: 80%;
}


</style>

<div class="container block">
<!-- Panel -->
<div class="panel panel-default resize center-block">
<!-- Default panel contents -->
	<div class="panel-heading text-center"><h1>Register Student</h1></div>
		<%
	// Construct the captchas object (Default Values)
	CaptchasDotNet captchas = new CaptchasDotNet(
 		 request.getSession(true),     // Ensure session
  		 "pratikpalashikar",                       // client
  		 "B2okmVNlBkJEUUz069QcbggJT2aTb8AjoeXwVJ5K"                      // secret
  	);
// Construct the captchas object (Extended example)
// CaptchasDotNet captchas = new captchas.CaptchasDotNet(
//  request.getSession(true),     // Ensure session
//  "demo",                       // client
//  "secret",                     // secret
//  "01",                         // alphabet
//  16,                           // letters
//  500,                          // width
//  80                            // height
//  );
%>
		<form action="register" method="post" name="register_form">
		<div class="panel-body center-block resize-body">
			
					<label for="message"><font color="#e67e22" size="4"><%=message%></font></label>
						<div class="">
							<div class="form-group">
				
								<input  type='hidden' id='submitted' name='submitted'/>
								<script>
								document.getElementById("submitted").value = true;
							</script>
	
							<label for="userid"><font color="#0" size="4">Student ID</font></label> 
							<br>
							<input type="text" class="form-control" name=userid placeholder="1000xxxxxx or 6000xxxxxx">
							<br>
							<label for="password"><font color="#0" size="4">Password</font></label> 
							<br>
							<input type="password" class="form-control" name=Rpassword>
							<br>
							<label for="repeatPassword"><font color="#0" size="4">Repeat Password</font></label> 
							<br>
							<input type="password" class="form-control" name=repeatPassword>
							<br>
							<label for="emailAddress"><font color="#0" size="4">Email Address</font></label> 
							<br>
							<input type="text" class="form-control" name=emailAddress placeholder="firstname.lastname@mavs.uta.edu"> 
						    <br>   
						    <label for="phoneNumber"><font color="#0" size="4">Contact No</font></label> 
							<br>
							<input type="tel" class="form-control" name=phoneNumber placeholder="+1 000-000-(0000)"> 
						    <br>
							<label ><font color="#0" size="4">How would you like to get Notified</font></label>
							<br>
							<input type="radio"  name="notification" value=1> Phone
							<br>
							<input type="radio"  name="notification" value=2> Email
							<br>
							<input type="radio"  name="notification" value=3> SMS	
							<br>
							<label for="password"><font color="#0" size="4">Enter CAptcha</font></label>
							<br>
							<input type="text" class="form-control" name="password"> 
							<br>
							<%= captchas.image() %>
												    
						</div>
					</div>
				
				</div>
				<div  class="panel-footer text-center">
				    <input type="submit" class="btn-lg" value="Submit">
				</div>
			</form>
		</div>
</div>		
	

		<%@include file="templates/footer.jsp"%>
