%%%-------------------------------------------------------------------
%%% @copyright (C) 2017, 2600Hz
%%% @doc
%%% FreeSWITCH proplists
%%% @end
%%% @contributors
%%%-------------------------------------------------------------------
-module(kzd_conference).

-export([conference_id/1
        ,participant_id/1
        ,profile/1
        ,instance_id/1
        ,event/1
        ,call_id/1
        ,ccv/2, ccv/3
        ,custom_channel_vars/1
        ,conference_channel_vars/1
        ,join_time/1, join_time/2
        ,core_uuid/1
        ,switch_url/1, switch_uri/1, switch_hostname/1
        ,conference_node/1
        ,account_id/1
        ,caller_id_number/1, caller_id_name/1
        ]).

-include("kz_documents.hrl").

-type data() :: kz_json:object().
-export_type([data/0]).


-spec call_id(data()) -> api_binary().
call_id(JObj) ->
    kz_json:get_ne_binary_value(<<"Call-ID">>, JObj).

-spec ccv(data(), ne_binary()) -> api_binary() | ne_binaries().
ccv(JObj, Key) ->
    ccv(JObj, Key, 'undefined').

-spec ccv(data(), ne_binary(), Default) -> ne_binary() | ne_binaries() | Default.
ccv(JObj, Key, Default) ->
    kz_json:get_value(Key, custom_channel_vars(JObj), Default).

-spec custom_channel_vars(data()) -> data().
custom_channel_vars(JObj) -> kz_json:get_json_value(<<"Custom-Channel-Vars">>, JObj).

-spec conference_channel_vars(data()) -> data().
conference_channel_vars(JObj) -> kz_json:get_json_value(<<"Conference-Channel-Vars">>, JObj).

-spec event(data()) -> api_binary().
event(JObj) ->
    kz_json:get_ne_binary_value(<<"Event">>, JObj).

-spec conference_id(data()) -> api_ne_binary().
conference_id(JObj) ->
    kz_json:get_ne_binary_value(<<"Conference-ID">>, JObj).

-spec participant_id(data()) -> api_ne_binary().
participant_id(JObj) ->
    kz_json:get_ne_binary_value(<<"Participant-ID">>, JObj).

-spec profile(data()) -> api_ne_binary().
profile(JObj) ->
    kz_json:get_ne_binary_value(<<"Profile">>, JObj).

-spec instance_id(data()) -> api_ne_binary().
instance_id(JObj) ->
    kz_json:get_ne_binary_value(<<"Instance-ID">>, JObj).

-spec join_time(data()) -> gregorian_seconds().
-spec join_time(data(), Default) -> gregorian_seconds() | Default.
join_time(JObj) ->
    join_time(JObj, kz_time:current_tstamp()).
join_time(JObj, Default) ->
    kz_json:get_integer_value(<<"Join-Time">>, JObj, Default).

-spec core_uuid(data()) -> api_binary().
core_uuid(JObj) ->
    kz_json:get_value(<<"Core-UUID">>, JObj).

-spec switch_url(data()) -> api_binary().
switch_url(JObj) ->
    kz_json:get_ne_binary_value(<<"Switch-URL">>, JObj).

-spec switch_uri(data()) -> api_binary().
switch_uri(JObj) ->
    kz_json:get_ne_binary_value(<<"Switch-URI">>, JObj).

-spec switch_hostname(data()) -> api_binary().
switch_hostname(JObj) ->
    kz_json:get_ne_binary_value(<<"Switch-Hostname">>, JObj).

-spec conference_node(data()) -> api_binary().
conference_node(JObj) ->
    kz_json:get_ne_binary_value(<<"Conference-Node">>, JObj).

-spec account_id(data()) -> data().
account_id(JObj) ->
    kz_json:get_ne_binary_value(<<"Account-ID">>, JObj).

-spec caller_id_name(data()) -> api_ne_binary().
caller_id_name(JObj) ->
    kz_json:get_ne_binary_value(<<"Caller-ID-Name">>, JObj).

-spec caller_id_number(data()) -> api_ne_binary().
caller_id_number(JObj) ->
    kz_json:get_ne_binary_value(<<"Caller-ID-Number">>, JObj).
