<jsp:include page='<%=(String) request.getAttribute("includeHeader")%>' />
<% ArrayList<String> array = (ArrayList<String>)session.getAttribute("advisors");
	if (array != null){ %>	    		
<div class="container">
	<div class="page-header">
		<div class="pull-right form-inline">
			<div class="btn-group">
				 	<form action="advising" method="post" name="advisor_form">
				 	<input type=hidden name=advisor_button id="advisor_button">
		    		<%@ page import= "java.util.ArrayList" %>
		    		
		    		<!-- begin processing advisors  -->
		    				<button type="button" id="all1" onclick="alladvisors()">All</button>
		    				<script> function alladvisors(){
		    							document.getElementById("advisor_button").value = "all";
		    							advisor_form.submit();
		    						 }
		    				</script>
		    			<%	for (int i=0;i<array.size();i++){ %>
		    					<button type="button" id="button1<%=i%>" onclick="button<%=i%>()"><%=array.get(i)%></button>
								<script> function button<%=i%>(){
										document.getElementById("advisor_button").value = "<%=array.get(i)%>";
										advisor_form.submit();
								}</script>
						<%	}%>
				</form>
			</div>
		</div>
	</div>
	<%} 
		 else{%>
		    <label><font color="#e67e22" size="5"> Log in to see Advisor schedules. </label>
			<% } %>
					 <!-- end processing advisors -->	 
	
	<div class="date-display span12">
		<h3></h3>
	</div>
	
			<div id='calendar'></div>
		<%@ page import= "uta.mav.appoint.TimeSlotComponent" %>
		<%@ page import= "uta.mav.appoint.PrimitiveTimeSlot" %>
		<%@ page import= "uta.mav.appoint.CompositeTimeSlot" %>
		<%@ page import= "uta.mav.appoint.beans.AdvisingSchedule" %>
		<%@ page import= "uta.mav.appoint.beans.Appointment" %>
		
		<!--  begin processing schedules -->
		<% ArrayList<TimeSlotComponent> schedules = (ArrayList<TimeSlotComponent>)session.getAttribute("schedules");
		   ArrayList<Appointment> appointments = (ArrayList<Appointment>)session.getAttribute("appointments");
		    				%><script>
		    				$(document).ready(function(){
		    					$('#calendar').fullCalendar({
		    						header: {
		    							left:'month,basicWeek,basicDay',
		    							right: 'today, prev,next',
		    							center: 'title'
		    						},
		    						displayEventEnd : {
		    							month: true,
		    							basicWeek: true,
		    							'default' : true,
		    						}
		    						<%if (schedules != null && appointments!=null){%>
		    				    	,
		    						eventClick: function(event,element){
		    							if (event.id >= 0){
		    							<%if (appointments.size() <= 1) {
		    								
		    							%>	
		    							document.getElementById("id1").value = event.id;
		    							document.getElementById("pname").value = event.title;
		    							$('#info').modal();
		    							<%
		    							//addAppt.submit();
		    							}
		    							else{%>
		    							$('#updateAppt').modal();	
		    							//updateAppt.submit();
		    							<%}%>
		    							}
		    						},
		    					events: [
		    					         
		    					         {
		    					        	 	title:'<%="Waitlist "+ schedules.get(0).getName()%>',
			 									start:'<%="2016-11-27T"+schedules.get(0).getStartTime()%>',
			 									end:'<%="2016-11-27T"+schedules.get(0).getEndTime()%>',
			 									id:<%=100%>,
			 									backgroundColor: 'black'
		    					         },
		    					         
		 		    		<% int i = 0;
									for (i=0;i<schedules.size();i++){%> 
		 								{
		 			
		 									title:'<%=schedules.get(i).getName()%>',
		 									start:'<%=schedules.get(i).getDate()+"T"+schedules.get(i).getStartTime()%>',
		 									end:'<%=schedules.get(i).getDate()+"T"+schedules.get(i).getEndTime()%>',
		 									id:<%=i%>,
		 									backgroundColor: 'blue'
		 								}
		 								<%if(i != (schedules.size()-1)||appointments != null){%>,<%}%>
		 					 		<%}
									
									if (appointments != null){
										for(i=1;i<1+appointments.size();i++){%>
		 									{
 												title:'<%=appointments.get(i-1).getAppointmentType()%>',
 												start:'<%=appointments.get(i-1).getAdvisingDate()+"T"+appointments.get(i-1).getAdvisingStartTime()%>',
 												end:'<%=appointments.get(i-1).getAdvisingDate()+"T"+appointments.get(i-1).getAdvisingEndTime()%>',
 												id:<%=-i%>,
 												backgroundColor: 'orange'
		 									}
 											<%if(i != appointments.size()){%>,<%}
 										}
									}%>		 					 
		 					 			]<%}%>
		    					
		    					});
		    			
		    				});
	 						</script>	
		 						

	<!-- <form name=addAppt action="schedule" method="get">
		<input type="hidden" name=id1 id="id1">
		<input type="hidden" name=pname id="pname">
		<input type="hidden" name=advisor_email id="advisor_email">
	</form>	 -->	
	
	<form name=info action="schedule" method="get">
	<div class="modal fade" id="info" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id=infoLabel">Miscellaneous Information</h4>
				</div>
				<div class="modal-body">
							<input type="hidden" name=id1 id="id1">
							<input type="hidden" name=pname id="pname">
							<input type="hidden" name=advisor_email id="advisor_email">
							<label for="reason"><font color="#0" size="4">Reason for Advising</font></label> 
							<br>
							<input type="text" class="form-control" name=reason placeholder="Enter the reason for advising ?">
							<label for="time"><font color="#0" size="4">Approximate time</font></label> 
							<br>
							<input type="text" class="form-control" name=time placeholder="How much time it will take ?">
							<label for="enrolled"><font color="#0" size="4">Courses enrolled</font></label> 
							<br>
							<input type="text" class="form-control" name=enrolled placeholder="which course you are enrolled ?">
							<label for="semester"><font color="#0" size="4">Current Semester</font></label> 
							<br>
							<input type="text" class="form-control" name=semester placeholder="which semester you are in ?">
							<label for="opt"><font color="#0" size="4">Advising for OPT</font></label> 
							<br>
							<input type="text" class="form-control" name=opt placeholder="Is the advising needed for opt ?">
							<label for="urgent"><font color="#0" size="4">Is appointment urgent ?</font></label> 
							<br>
							<input type="text" class="form-control" name=urgent placeholder="Is the appointment urgent ?">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						data-dismiss="modal"> Close 
					</button>
					<input type="submit" class="btn btn-default" value="Submit">
				</div>
			</div>
		</div>
	</div>
	</form> 							
	
	<form name=updateAppt action="" method="get">
		<div class="modal fade" id="updateAppt" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id=infoLabel">Warning</h4>
				</div>
				<div class="modal-body">
							<h1>You already have booked appointment </h1>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						data-dismiss="modal"> Close 
					</button>
					
				</div>
			</div>
		</div>
	</div>
	</form>
	<br/><br/><hr>
</div>
<style>
	#calendar {
		background-color: white;
	}
</style>
<%@include file="templates/footer.jsp" %>