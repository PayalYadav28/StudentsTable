<%@page import="com.example.demo.bean.Students"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

    <title>CRUD FROM API</title>

    <link href="css/home.css" rel="stylesheet">
  </head>
  <body>

    <nav class="navbar navbar-dark bg-mynav">
      <div class="container-fluid">
        <a class="navbar-brand" href="#"></a>
      </div>
    </nav> 

    <div class="container">
      <div class="d-flex bd-highlight mb-3">
        <div class="me-auto p-2 bd-highlight"><h2>Students Data</div>
        <div class="p-2 bd-highlight">
          <button type="button" class="btn btn-secondary" onclick="showUserCreateBox()"><a style="text-decoration: none;color: white;font-size: 23px;" href="register">Create</a></button>
        </div>
      </div>

      <div class="table-responsive">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">FirstName</th>
              <th scope="col">LastName</th>
              <th scope="col">Phone No</th>
              <th scope="col">Email</th>
              <th scope="col">Password</th>
              <th scope="col">Gender</th>
              <th scope="col"></th>
              <th scope="col"></th>
            </tr>
          </thead>
           <%List<Students>list=(List)session.getAttribute("students");
           for(Students s:list){%>
           
           
           
          <tbody id="mytable">
            <tr>
              <th scope="row" colspan="1"><%=s.getId() %></th>
              <th scope="row" colspan="1"><%=s.getFirstname() %></th>
              <th scope="row" colspan="1"><%=s.getLastname() %></th>
              <th scope="row" colspan="1"><%=s.getPhoneno() %></th>
              <th scope="row" colspan="1"><%=s.getEmail() %></th>
              <th scope="row" colspan="1"><%=s.getPassword() %></th>
              <th scope="row" colspan="1"><%=s.getGender() %></th>
              <th scope="row" colspan="1"><button style="background-color: grey;border: none;"><a style="text-decoration: none;color:white;" href="update?id=<%=s.getId()%>&firstname=<%=s.getFirstname()%>&lastname=<%=s.getLastname()%>&phoneno=<%=s.getPhoneno()%>&email=<%=s.getEmail()%>&password=<%=s.getPassword()%>&gender=<%=s.getGender()%>">Update</a></button></th>
              <th scope="row" colspan="1"><button style="background-color: grey;border: none;"><a style="text-decoration: none;color:white;" href="delete?id=<%=s.getId()%>">Delete</a></button></th>
              

            </tr>
          </tbody>
          <%}
           
           %>
        </table>
      </div>
    </div>

    <script src="index.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.16/dist/sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  </body>
</html>