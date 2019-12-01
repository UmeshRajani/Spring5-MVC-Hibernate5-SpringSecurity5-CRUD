<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-xs-12 col-md-12">
		<ul class="breadcrumb">
			<li><a href="${contextRoot}/home">Home</a></li>
			<li class="active">Ticket List</li>
		</ul>
		<div>
			<table id="ticketTable" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Sl. No.</th>
						<th>Ticket Date</th>
						<th>Subject</th>
						<th>Description</th>
						<th>Category</th>
						<th>Status</th>
						<th>City</th>
						<th>User</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				<c:set var="count" value="0" scope="page" />
				<c:forEach items="${list}" var="ticket">
					<c:set var="count" value="${count + 1}" scope="page" />
						<tr>
							<td>${count}</td>
							<td>${ticket.createdDate}</td>
							<td>${ticket.subject}</td>
							<td>${ticket.description}</td>
							<td>${ticket.category}</td>
							<td>${ticket.status}</td>
							<td>${ticket.address.city}</td>
							<td><a
								href="${contextRoot}/webrst/editUser?id=${ticket.user.id}">${ticket.user.name}</a></td>
							<td><a
								href="${contextRoot}/webrst/editTicket?id=${ticket.id}"
								data-toggle="tooltip" title="Edit"><i
									class="fa fa-pencil-square-o" aria-hidden="true"></i></a> | <a
								href="${contextRoot}/webrst/deleteTicket?id=${ticket.id}"
								data-toggle="tooltip" title="Delete"><i class="fa fa-trash"
									aria-hidden="true"></i></a></td>
						</tr>					
				</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</div>
<script>
$(document).ready(function() {
    $('#ticketTable').DataTable();
});
</script>