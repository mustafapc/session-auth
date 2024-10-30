-module(main_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req, State) ->
Cookies = cowboy_req:parse_cookies(Req),
B = lists:keyfind(<<"sessionid">>, 1, Cookies),

_C = "mu",
case B of 
false -> cowboy_req:reply(301, #{<<"content-type">> => <<"text/plain">>, <<"location">> => <<"/login">>}, Req);
  
{_, _Cookie} -> cowboy_req:reply(200, #{<<"content-type">> => <<"text/plain">>}, <<"work">>, Req)
end,
	{ok, Req, State}.
