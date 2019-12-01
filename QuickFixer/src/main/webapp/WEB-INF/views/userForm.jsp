<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="row">
	<div class="col-md-12">
		<ul class="breadcrumb">
			<li><a href="${contextRoot}/home">Home</a></li>
			<li><a href="${contextRoot}/webrst/user">Users List</a></li>
			<li class="active">Add User</li>
		</ul>
	</div>
	<div>User Details</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary"
			style="display: flex; justify-content: center;">
			<div class="panel-body">
				<form:form class="justify-content-center"
					action="${contextRoot}/webrst/saveUserData" modelAttribute="user">
					<div class="form-group">
						<label class="control-label col-md-4" for="username"><spring:message
								code="username" />:</label>
						<form:input type="text" path="name" class="form-control"
							id="username" />
					</div>
					<div class="form-group">
						<label class="control-label col-md-4" for="password"><spring:message
								code="password" />:</label>
						<form:input type="password" path="password" class="form-control"
							id="password" />
					</div>
					<div class="form-group">
						<label class="control-label col-md-4" for="gender"><spring:message
								code="gender" />Gender:</label>
						<form:select path="gender" class="form-control" id="gender">
							<form:option value="Male">Male</form:option>
							<form:option value="Female">Female</form:option>
						</form:select>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4" for="city"><spring:message
								code="city" />:</label>
						<form:input type="text" path="city" class="form-control" id="city" />
					</div>
					<div class="form-group">
						<label class="control-label col-md-4" for="authority"><spring:message
								code="role" />:</label>
						<form:select path="authority.id" items="${role}" itemValue="id"
							itemLabel="authority" class="form-control" />
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary pull-right">
							<spring:message code="save" />
						</button>
						&nbsp;
						<button type="button" class="btn btn-danger pull-right"
							style="margin-right: 10px;">
							<spring:message code="reset" />
						</button>
					</div>
					<!-- hidden elements -->
					<form:hidden path="id" />
				</form:form>
			</div>
		</div>
	</div>
</div>