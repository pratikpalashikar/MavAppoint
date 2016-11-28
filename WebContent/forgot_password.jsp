<%@ include file="templates/header.jsp" %>
<style>
.panel-heading {
    padding: 5px 15px;
}

.panel-footer {
	padding: 1px 15px;
	color: #A0A0A0;
}

.profile-img {
	width: 96px;
	height: 96px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}
</style>

<script type="text/javascript">

$(document).ready(function(){
	
	$('#send').on('click',function(){
		window.location = "change_password#";			
	});
});

</script>

 <div class="container" style="margin-top:40px">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong> Security Question</strong>
					</div>
					<div class="panel-body">
						<form role="form">
							<fieldset>
								<div class="row">
									<div class="center-block">
										<img class="profile-img"
											src="img/mavblue.jpg" alt="">
									</div>
								</div>
								<div class="row">
								
									<div class="col-sm-12 col-md-10  col-md-offset-1 ">
										<label for="emailAddress">Email Address</label>
												<br>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-user"></i>
												</span> 
												<input type="text" class="form-control" name=emailAddress placeholder="yourname@mavs.uta.edu">
											</div>
										</div>
										<label for="question1">Mothers Maiden Name</label>
												<br>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-user"></i>
												</span> 
												
												<input type="text" class="form-control" name=question1>
											</div>
										</div>
										<label for="question2">Pet's Name</label>
												<br>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-user"></i>
												</span> 
												
												<input type="text" class="form-control" name=question2>
											</div>
										</div>
										<label for="question3">Favourite Teacher</label>
												<br>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-user"></i>
												</span> 
												
												<input type="text" class="form-control" name=question3>
											</div>
										</div>
									<div class="form-group">
											<input id="send" class="btn btn-lg btn-primary btn-block" value="Send">
										</div>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
					<div class="panel-footer ">
					</div>
                </div>
			</div>
		</div>
	</div>


<%@ include file="templates/footer.jsp" %>