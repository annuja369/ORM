<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<title>Customer Management</title>
</head>
<body class="bg-light">
	<div
		class="container rounded p-3 my-5 text-black border shadow p-3 mb-5 bg-white rounded">
		<div class="container rounded p-3 my-0 bg-info">
			<h1 style="text-align: center;" class="text-light">Customer
				Relationship Management</h1>
			<h2 style="text-align: center;">Great Learning</h2>
		</div>
		<hr style="background-color: black; height: 5px;">
		<div class="container">

			<h3>Customers Directory</h3>
			<hr>

			<!-- Add a search form -->

			<form action="/ORMandMVCAssignment/customers/search"
				class="form-inline">

				<!-- Add a button -->
				<div class="col-sm-5">
					<a href="/ORMandMVCAssignment/customers/showFormForAdd"
						class="btn btn-outline-info btn-lg btn-sm mr-2 mb-3 shadow rounded">
						<i class="fa fa-user-plus" aria-hidden="true"></i> Add Customer
					</a> <a href="/ORMandMVCAssignment/customers/list"
						class="btn btn-outline-info btn-lg btn-sm mr-2 mb-3 shadow rounded"><i
						class="fa fa-address-book" aria-hidden="true"></i> Customer List </a>

				</div>

				<div class="col-sm-7">
					<input type="search" name="firstName" placeholder="First Name"
						class="form-control mb-3 mr-2 col-4 shadow rounded" /> <input
						type="search" name="lastName" placeholder="Last Name"
						class="form-control mb-3 mr-2 col-4 shadow rounded" />

					<button type="submit"
						class="btn btn-outline-info btn-lg btn-sm mr-2 mb-3 shadow rounded">
						<i class="fa fa-search" aria-hidden="true"></i> Search
					</button>

					<a href="/ORMandMVCAssignment/"
						class="btn btn-outline-info btn-lg btn-sm mr-2 mb-3 shadow rounded">
						<i class="fa fa-home" aria-hidden="true"></i> Home
					</a>
				</div>

			</form>

			<table class="table table-bordered table-striped shadow rounded">
				<thead class="thead-dark">
					<tr>
						<th style="text-align: center">Customer Id</th>
						<th style="text-align: center">First Name</th>
						<th style="text-align: center">Last Name</th>
						<th style="text-align: center">Email</th>
						<th style="text-align: center">Action</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${Customers}" var="tempCustomer">

						<tr>
							<td style="text-align: center"><c:out
									value="${tempCustomer.id}" /></td>
							<td style="text-align: center"><c:out
									value="${tempCustomer.firstName}" /></td>
							<td style="text-align: center"><c:out
									value="${tempCustomer.lastName}" /></td>
							<td style="text-align: center"><c:out
									value="${tempCustomer.email}" /></td>
							<td>
								<div style="text-align: center">
									<!-- Add "update" button/link -->
									<a
										href="/ORMandMVCAssignment/customers/showFormForUpdate?customerId=${tempCustomer.id}"
										class="btn btn-outline-info btn-lg btn-sm shadow rounded"><i
										class="fas fa-pen"></i> Update </a> |

									<!-- Add "delete" button/link -->
									<a
										href="/ORMandMVCAssignment/customers/delete?customerId=${tempCustomer.id}"
										class="btn btn-outline-danger btn-sm shadow rounded"
										onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false"><i
										class="fas fa-trash"></i> Delete </a>
								</div>
							</td>

						</tr>

					</c:forEach>
				</tbody>

			</table>

		</div>
	</div>
</body>
</html>