accessing - convenience
maxPropertyCount
	"Look for the largest set of consecutive property steps that are reachable from here."
	
	| maxCount currentCount |
	maxCount := 0.
	currentCount := 0.
	
	self allStepsDo: [:step |
		step isPropertyStep
			ifTrue: [currentCount := currentCount + 1]
			ifFalse: [
				maxCount := maxCount max: currentCount.
				currentCount := 0]].
	
	maxCount := maxCount max: currentCount.
	^ maxCount = 0
		ifTrue: [#defaultProperties asScript maxPropertyCount]
		ifFalse: [maxCount]