as yet unclassified
drawOn: aCanvas

	aCanvas
		fillRectangle: self bounds
		color: ((Color fromString: '#7B84AE') alpha: 0.15).
	{
		{2. 0. 1. Color fromString: '#515D91'}.
		{0. 3. 1. Color fromString: '#172357'}.
		{1. 0. 1. Color fromString: '#7B84AE'}
	} do: [:spec | UiPlatform current
		canvas: aCanvas
		frameRoundRect: (self bounds insetBy: spec first)
		radius: spec second
		width: spec third
		color: spec fourth].