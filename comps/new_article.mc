<html>
   <head>
     <link rel="stylesheet" href="/static/css/blog.css">
     <title>My Blog: Home</title>
   </head>
   <body>

<%init>

warn("============new_article is being executed!\n");

</%init>

     <h2>This is article Page</h2>
	 <form action="publish" type="POST">
	  <input type="text" id="title" class="fadeIn third" name="title" placeholder="Enter your title">
	  <br />
      <input type="text" id="content" class="fadeIn second" name="content" placeholder="Enter your content">
	  <br />
	  <br />
      <input type="submit" class="fadeIn fourth" value="Create Article">
	  <br />
	  <br />
	  <a href="/">Back to Home</a>
	  <br />
	  <br />
	  <h2 style="color:#069">
		<% $m -> req -> session -> {message} %>
	  </h2>
	
	</br>
	</br>
    </form>
    
  </body>
</html>