-module(handlelogin_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req, State) ->
{ok, KeyValues, Req0} = cowboy_req:read_urlencoded_body(Req),
[A, B] = KeyValues,
[C, D] = [element(2, A), element(2, B)],
E = base64:encode(D),
{ok, ConnPid} = gun:open("localhost", 8000),
StreamRef = gun:post(ConnPid, "/sql", [{<<"content-type">>, "text/plain"},
{<<"Accept">>, "application/json"},
{<<"surreal-ns">>, "dbs"},
{<<"surreal-db">>, "db1"},
{<<"authorization">>, ["Basic ", base64:encode("root:root")]}], ["DELETE person;
CREATE person CONTENT {
email: \"", C, "\",
password: \"", D, "\",
session: \"", E, "\",};"]),
case gun:await(ConnPid, StreamRef) of
    {response, fin, _Status, _Headers} ->
        no_data;
    {response, nofin, _Status, _Headers} ->
        {ok, Body} = gun:await_body(ConnPid, StreamRef),
		io:fwrite(Body)
end,
Req2 =cowboy_req:set_resp_cookie(<<"sessionid">>, E, Req0),
Req1 = cowboy_req:reply(301, #{<<"content-type">> => <<"text/plain">>,
<<"location">> => <<"/hi/user">>},"hi", Req2),
{ok, Req1, State}.
