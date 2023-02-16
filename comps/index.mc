<html>
   <head>
     <link rel="stylesheet" href="/static/css/blog.css">
     <title>My Blog: Home</title>
<%init>
	my $session = $m->req->session;
	$session->{message} = "";
</%init>
   </head>
   <body>
    
     <h2>Create Article Application.</h2>
	 The local time is <% scalar(localtime) %>.
	<& all_articles.mi &>
	</br>
	</br>
	
	
% $.HTMLPara {{
First paragraph.
   
Second paragraph.
% }}


	
	<a href="/new_article">Add an article</a>
	</br>
	</br>
	
	
  </body>
 

</html>