-module(session_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
Dispatch = cowboy_router:compile([
{'_', [{"/login", login_handler, []}, {"/:name", main_handler, []}]}                                
                                 ]),
{ok, _} = cowboy:start_clear(http_listner, [{port, 8080}], #{env => #{dispatch => Dispatch}}),
  session_sup:start_link().

stop(_State) ->
	ok.
