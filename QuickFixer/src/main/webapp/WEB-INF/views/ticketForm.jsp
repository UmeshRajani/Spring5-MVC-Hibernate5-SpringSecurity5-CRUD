<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="row">
	<div class="col-md-12">
		<ul class="breadcrumb">
			<li><a href="${contextRoot}/home">Home</a></li>
			<li><a href="${contextRoot}/webrst/ticket">Ticket List</a></li>
			<li class="active">Add Ticket</li>
		</ul>
		<div class="panel-heading">Ticket Details</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary"
			style="display: flex; justify-content: center;">
			<div class="panel-body">
				<form:form class="form-horizontal"
					action="${contextRoot}/webrst/saveTicketData"
					modelAttribute="ticket">
					<c:if test="${readOnly}">
						<div class="form-group">
							<label class="control-label col-md-4" for="username">Username:</label>
							<input type="text" class="form-control" id="username"
								readonly="${readOnly}" value="${ticket.user.name}" />
						</div>
					</c:if>
					<div class="form-group">
						<label class="control-label col-md-4" for="subject">Subject:</label>
						<form:input type="text" path="subject" class="form-control"
							id="subject" />
					</div>
					<div class="form-group">
						<label class="control-label col-md-4" for="description">Description:</label>
						<form:input type="text" path="description" class="form-control"
							id="description" />
					</div>
					<div class="form-group">
						<label class="control-label col-md-4" for="type">Category:</label>
						<form:select path="category" class="form-control" id="category">
							<form:option value="Plumbing">Plumbing</form:option>
							<form:option value="Electricity">Electronics/Wiring</form:option>
							<form:option value="Furniture">Furniture Repairing</form:option>
							<form:option value="Painting">Painting</form:option>
							<form:option value="RO">RO/WM Service</form:option>
						</form:select>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4" for="type">Status:</label>
						<security:authorize access="hasRole('ADMIN')">
						<form:select path="status" class="form-control" id="status">
							<form:option value="Pending">Pending</form:option>
							<form:option value="InProgress">InProgress</form:option>
							<form:option value="Resolved">Resolved</form:option>
						</form:select>
						</security:authorize>
						<security:authorize access="hasRole('USER')">
						<form:select path="status" class="form-control" id="status" disabled="true">
							<form:option value="Pending">Pending</form:option>
							<form:option value="InProgress">InProgress</form:option>
							<form:option value="Resolved">Resolved</form:option>
						</form:select>
						<form:hidden path="status" />
						</security:authorize>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-4" for=houseNumber>House/Flat:</label>
						<form:input type="text" path="address.houseNumber"
							class="form-control" />
					</div>
					<div class="form-group">
						<label class="control-label col-md-4" for=society>Society:</label>
						<form:input type="text" path="address.society"
							class="form-control" />
					</div>
					<div class="form-group">
						<label class="control-label col-md-4" for=area>Area:</label>
						<form:input type="text" path="address.area" class="form-control" />
					</div>
					<div class="form-group">
						<label class="control-label col-md-4" for=city>City:</label>
						<form:input type="text" path="address.city" class="form-control" />
					</div>
					<div class="form-group">
						<label class="control-label col-md-4" for=pincode>Pincode:</label>
						<form:input type="text" path="address.pincode"
							class="form-control" />
					</div>
					<div class="form-group">

						<button type="submit" class="btn btn-primary pull-right">Save</button>
						&nbsp;
						<button type="button" class="btn btn-danger pull-right"
							style="margin-right: 10px;">Reset</button>
					</div>
					<!-- hidden elements -->
					<form:hidden path="user.id" value="${userId}" />
					<form:hidden path="id" />
					<form:hidden path="address.id" />
					
				</form:form>
			</div>
		</div>
	</div>
</div>