PROJECT = session

DEPS = cowboy
dep_cowboy_commit = 2.11.0

REL_DEPS = relx

DEP_PLUGINS = cowboy, gun

include erlang.mk
