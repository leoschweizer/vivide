accessing
selectedNodes

	self assert: selectionMap notNil.
	^ (selectionMap collectWithIndex: [:selected :index |
		selected
			ifTrue: [self model childAt: index inGroup: self model groups first]
			ifFalse: []]) select: [:ea | ea notNil]