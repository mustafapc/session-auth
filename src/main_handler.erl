-module(main_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req, State) ->
Cookies = cowboy_req:parse_cookies(Req),
B = lists:keyfind(<<"sessionid">>, 1, Cookies),
{ok, ConnPid} =gun:open("localhost", 8000),
_C = "mu",
case B of 
false -> cowboy_req:reply(301, #{<<"content-type">> => <<"text/plain">>, <<"location">> => <<"/login">>}, Req);
  
{_, Cookie} ->StreamRef = gun:post(ConnPid, "/sql", [{<<"content-type">>, "text/plain"},
{<<"Accept">>, "application/json"},
{<<"surreal-ns">>, "dbs"},
{<<"surreal-db">>, "db1"},
{<<"Authorization">>, ["Basic ", base64:encode("root:root")]}], ["SELECT * FROM person WHERE session = \"", Cookie, "\""]),
io:fwrite(base64:encode("root:root")),
case gun:await(ConnPid, StreamRef) of
    {response, fin, _Status, _Headers} ->
        no_data;
    {response, nofin, _Status, _Headers} ->
        {ok, Body} = gun:await_body(ConnPid, StreamRef),
		io:fwrite(Body),
        cowboy_req:reply(200, #{<<"content-type">> => <<"text/plain">>}, Body, Req)
end
end,
	{ok, Req, State}.
