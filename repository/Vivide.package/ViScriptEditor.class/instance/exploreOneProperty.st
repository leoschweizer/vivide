actions - debugging
exploreOneProperty

	self interpretUpToSelf ifNotNil: [:interpreter |
		interpreter hasObjects ifFalse: [
			self warningSent: 'There are no objects.'.
			^ self].
		interpreter allObjects anyOne in: [:obj |
		(interpreter
			propertiesFor: obj
			ifNone: [
				self warningSent: 'Using default properties...'.
				"Just use default properties for the object at hand."
				(ViQueryInterpreter on: (ViQueryStep
					use: {obj}
					in: #defaultProperties asScript)) upToNextProperties; propertiesFor: obj])
			explore]].