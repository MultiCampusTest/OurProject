<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- ��Ʈ��Ʈ�� -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--   Ŀ����CSS -->
<link href="css/noticeView.css" rel="stylesheet">
  
<title>Insert title here</title>
</head>
<body>
 <div class="container">

 <div class="row">

     <!-- Blog Post Content Column -->
     <div class="col-lg-12">

         <!-- Blog Post -->

         <!-- Title -->
         <h1>Blog Post Title</h1>

         <!-- Author -->
         <p class="lead">
             by <a href="#">Start Bootstrap</a>
         </p>

         <hr>

         <!-- Date/Time -->
         <p><span class="glyphicon glyphicon-time"></span> Posted on August 24, 2013 at 9:00 PM</p>

         <hr>

         <!-- Preview Image -->
         <img class="img-responsive col-lg-12" src="http://placehold.it/900x300" alt="">
         
         <hr>

         <!-- Post Content -->
         <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae laborum minus inventore?</p>
         <hr>

         <!-- Blog Comments -->

         <!-- Comments Form -->
         <div class="well">
             <h4>Leave a Comment:</h4>
             <form role="form">
                 <div class="form-group">
                     <textarea class="form-control" rows="3"></textarea>
                 </div>
                 <button type="submit" class="btn btn-primary">Submit</button>
             </form>
         </div>

         <hr>

         <!-- Posted Comments -->

         <!-- Comment -->
         <div class="media">
             <a class="pull-left" href="#">
                 <img class="media-object" src="http://placehold.it/64x64" alt="">
             </a>
             <div class="media-body">
                 <h4 class="media-heading">Start Bootstrap
                     <small>August 25, 2014 at 9:30 PM</small>
                 </h4>
                 Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
             </div>
         </div>

         <!-- Comment -->
         <div class="media">
             <a class="pull-left" href="#">
                 <img class="media-object" src="http://placehold.it/64x64" alt="">
             </a>
             <div class="media-body">
                 <h4 class="media-heading">Start Bootstrap
                     <small>August 25, 2014 at 9:30 PM</small>
                 </h4>
                 Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                 <!-- Nested Comment -->
                 <div class="media">
                     <a class="pull-left" href="#">
                         <img class="media-object" src="http://placehold.it/64x64" alt="">
                     </a>
                     <div class="media-body">
                         <h4 class="media-heading">Nested Start Bootstrap
                             <small>August 25, 2014 at 9:30 PM</small>
                         </h4>
                         Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                     </div>
                 </div>
                 <!-- End Nested Comment -->
             </div>
         </div>

     </div>
 </div>
 <!-- /.row -->

 <hr>

 <!-- Footer -->
 <footer>
     <div class="row">
         <div class="col-lg-12">
             <p>Copyright &copy; Your Website 2014</p>
         </div>
     </div>
     <!-- /.row -->
 </footer>

    </div>
</body>
</html>