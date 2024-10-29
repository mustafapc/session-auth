{application, 'session', [
	{description, ""},
	{vsn, "rolling"},
	{modules, ['login_handler','session_app','session_sup']},
	{registered, [session_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{optional_applications, []},
	{mod, {session_app, []}},
	{env, []}
]}.