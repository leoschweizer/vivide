initialization - bookmarks
addWorkspace

	self addScriptAsBookmark:
		{ [:object | object] -> {
			#label -> 'Workspace'.
			#icon -> UiFugueIcons applicationTerminalIcon.
			#view -> ViWorkspaceView}} asScript.