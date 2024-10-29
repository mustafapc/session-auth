{application, 'session', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['session_app','session_sup']},
	{registered, [session_sup]},
	{applications, [kernel,stdlib]},
	{optional_applications, []},
	{mod, {session_app, []}},
	{env, []}
]}.