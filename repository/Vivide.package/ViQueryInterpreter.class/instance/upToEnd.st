interpreting
upToEnd

	| previousSteps |
	previousSteps := OrderedCollection new.
	numProperties := 0.
	properties := IdentityDictionary new.
	
	[step isNil or: [previousSteps includes: step]]
		whileFalse: [
			previousSteps add: step.
			self next].