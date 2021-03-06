initialization
reset
	"Configure my view with actual data."

	(self hasProperty: #isUpdating) ifTrue: [^ self].
	
	[
		self setProperty: #isUpdating toValue: true.
	
		self root removeAllMorphs.
	
		self model ifNil: [^ self].

		self aggregateModel.	
		self updateSubmorphs.
	] ensure: [self removeProperty: #isUpdating].