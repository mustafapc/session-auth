-module(main_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req, State) ->
A =cowboy_req:header(<<"sessionid">>, Req, "nothing"),
io:fwrite(A),
if 
A == "nothing" -> cowboy_req:reply(301, #{<<"content-type">> => <<"text/plain">>, <<"location">> => <<"http://localhost:8080/login">>}, <<"">>,Req);
true -> cowboy_req:reply()
end
	{ok, Req, State}.
