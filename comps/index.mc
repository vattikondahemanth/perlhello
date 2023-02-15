<html>
   <head>
     <link rel="stylesheet" href="/static/css/blog.css">
     <title>My Blog: Home</title>
<%init>
	my $session = $m->req->session;
</%init>
   </head>
   <body>
    
     <h2>Welcome to my blog.</h2>
	 Hello world! The local time is <% scalar(localtime) %>.
	<& all_articles.mi &>
	</br>
	</br>
	
	
	<h2 style="color:#069">
	<% $m -> req -> session -> {message} %>
    </h2>
	
	</br>
	</br>
	
	<a href="/new_article">Add an article</a>

  </body>
</html>