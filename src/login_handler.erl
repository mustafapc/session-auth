-module(login_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req, State) ->
Req0 = cowboy_req:reply(200, #{<<"content-type">> => <<"text/html">>}, <<"<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>

<form action=\"http://localhost:8080/handlelogin\", method=POST>
<div>
<label for=\"a\">email</label>
<input name=\"email\" id=\"a\" value=\"email\"/>
</div>

<div>
<label for=\"b\">password</label>
<input name=\"password\" id=\"b\" value=\"password\"/>
</div>
</form>

</body>
</html>">>, Req),
  {ok, Req0, State}.
