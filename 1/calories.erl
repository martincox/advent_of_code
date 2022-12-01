-module(calories).

-export([top_n_cals/1,
         top_n_cals/2]).

top_n_cals(F) ->
    top_n_cals(1, F).

top_n_cals(N, F) ->
    L = enumerate_calories(F),
    lists:sum(lists:sublist(L, N)).

enumerate_calories(F) ->
    {ok, Bin} = file:read_file(F),
    lists:reverse(lists:sort([lists:sum([binary_to_integer(I) || I <- string:split(B, "\n", all), I /= <<>>]) || B <- string:split(Bin, "\n\n", all)])).

