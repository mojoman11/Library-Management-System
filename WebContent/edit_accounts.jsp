<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="theme.css" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css">
<style>
.container-d-flex-justify-content-center{
padding-bottom: 140px;
padding-left: 475px;
padding-top: 10px;
background-color: black;
}
.navbar-brand{
padding-top: 50px;
padding-left:40px;
}
.table-bordered{
padding-left:10px;
padding-right:10px;}
.homepage{
padding-left:10px;}
</style>

</head>
<body >
<nav class="navbar navbar-dark bg-dark">
    <div class="container-d-flex-justify-content-center"> <a style="color:white;" class="navbar-brand" href="admin_login.jsp">
        <b>Library Management System</b>
      </a> </div>
  </nav>
  <table style="width:100%">
  <tbody>
  <tr>
  <td width="45%"><div><a class="btn btn-link" href="admin_login.jsp">Go To Homepage</a></div></td>
  <td width="50%"><div class="col-md-12"><a class="btn btn-link" href="create_account.jsp">Add Member</a></div></td>
  <td width="20%"><div class="logout-btn"><form action="ControllerServlet" method="post"><input type="hidden" id="action" name="action" value="logout"/><input class="btn btn-link" type="submit" value="Log Out"/></form></div></td>
  </tr></tbody></table>
  
    <br/>
  
  <table class="table table-bordered table-striped table-hover">
    <thead>
    
    </thead>
    <tbody>
    <tr>
 
    <!-- You can adjust the width of table columns as well -->
    <th class="col-md-2 text-center">Member ID</th>
    <th class="col-md-6 text-center">Member Name</th>
    <!-- Use text alignment like text-center or text-right -->
    <th class="text-center">Edit</th>
    <th class="text-center">Delete</th>
    </tr>
    <c:forEach items="${users}" var="user"> 
                <tr>
                    <td><c:out value="${user.getMemId()}" /></td>
                    <td><c:out value="${user.getName()}" /></td>
                    <td><button type="button" class="btn btn-link" data-toggle="modal" data-target="#editAccount" data-mem-id="${user.getMemId()}" data-mem-name="${user.getName()}" data-mem-email="${user.getEmail()}" data-mem-type="${user.getType()}">Edit</button></td>
                    <td><button type="button" class="btn btn-link" data-toggle="modal" data-target="#deleteAccount" data-mem-id="${user.getMemId()}" data-mem-name="${user.getName()}">Delete</button></td>
                </tr>
            </c:forEach> 
   
    
    </tbody>
    </table>
    <div class="modal fade" id="editAccount" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editModalLabel">Edit Details for: </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        </div>
        <div class="modal-body">
         <form id="edit-account-form" action="ControllerServlet" method="post">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Member ID:</label>
            <input type="text" class="form-control" name="member-id" value="" readonly>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Name:</label>
            <input type="text" class="form-control" name="member-name" value="">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Email ID:</label>
            <input type="text" class="form-control" name="member-email" value="">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Member Type:</label>
            <input type="radio" class="form-control" name="member-type" value="admin">Admin<br>
            <input type="radio" class="form-control" name="member-type" value="member" checked="yes">Regular Member<br>
          </div>
          <input type="hidden" name="action" value="edit_user"/>
        </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
           <input type="submit" form="edit-account-form" class="btn btn-primary" value="Save Changes"/>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="deleteAccount" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Are you sure?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        </div>
        <div class="modal-body">
         <h5 class="message" id="message">Are you sure you want to delete member </h5>
        </div>
        <div class="modal-footer">
          <form id="delete-account-form" action="ControllerServlet" method="post">
          <input type="hidden" name="action" value="delete_user"/>
          <input type="hidden" name="memId" value=""/>
          <input class="btn btn-link" type="submit" value="Yes"/>
          
          </form >
           <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <script>
  $('#editAccount').on('show.bs.modal', function (event) {
	  
	  var button = $(event.relatedTarget)
	  var memId = button.data('mem-id')
	  var name = button.data('mem-name')
	  var email = button.data('mem-email')
	  var type = button.data('mem-type')
	  var modal = $(this)
	  modal.find('.modal-title').text('Edit Details for: ' + name)
	  modal.find('input[name="member-id"]').val(memId)
	  modal.find('input[name="member-name"]').val(name)
	  modal.find('input[name="member-email"]').val(email)
	  modal.find('input[name="member-type"]').val(type)
	  modal.find('input[name="account-to-change"]').val(memId)
	  modal.find('input[name="change-name"]').val(name)
	  modal.find('input[name="change-email"]').val(email)
	  modal.find('input[name="change-type"]').val(type)
	  
	})
</script>
<script>
  $('#deleteAccount').on('show.bs.modal', function (event) {
	  
	  var button = $(event.relatedTarget)
	  var memId = button.data('mem-id')
	  var name = button.data('mem-name')
	  var modal = $(this)
	  
	  modal.find('.modal-body').text('Are you sure you want to delete member '+name+'?')
	  modal.find('input[name="memId"]').val(memId)
	  
	  
	})
</script>

</body>

</html>