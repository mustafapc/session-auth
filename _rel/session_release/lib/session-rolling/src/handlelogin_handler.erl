-module(handlelogin_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req, State) ->
{ok, KeyValues, Req0} = cowboy_req:read_urlencoded_body(Req),
[A, B] = KeyValues,
[C, D] = [element(2, A), element(2, B)],
Req1 = cowboy_req:reply(200, #{<<"content-type">> => <<"text/plain">>}, ["email: ", C, " password: ", D], Req0),
{ok, Req1, State}.
