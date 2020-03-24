%%%-------------------------------------------------------------------
%% @doc r3wf public API
%% @end
%%%-------------------------------------------------------------------

-module(r3wf_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    r3wf_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
