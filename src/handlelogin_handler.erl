-module(handlelogin_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req, State) ->
{ok, Data, Req0} = cowboy_req:read_body(Req),
Req1 = cowboy_req:reply(200, #{<<"content-type">> => <<"text/plain">>}, Data, Req0),
{ok, Req1, State}.
