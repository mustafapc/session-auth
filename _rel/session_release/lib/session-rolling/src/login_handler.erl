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

<h1>This is a Heading</h1>
<p>This is a paragraph.</p>

</body>
</html>">>, Req),
  {ok, Req0, State}.
