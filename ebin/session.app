{application, 'session', [
	{description, ""},
	{vsn, "rolling"},
	{modules, ['handlelogin_handler','login_handler','main_handler','session_app','session_sup']},
	{registered, [session_sup]},
	{applications, [kernel,stdlib,cowboy,gun]},
	{optional_applications, []},
	{mod, {session_app, []}},
	{env, []}
]}.