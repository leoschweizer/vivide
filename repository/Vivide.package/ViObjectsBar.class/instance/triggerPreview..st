preview handling
triggerPreview: aNode

	(ActiveHand submorphs notEmpty or: [aNode isNil])
		ifTrue: [^ self removeAlarm: #showPreview].

	previewHandler object == (aNode at: #state)
		ifTrue: [^ self].

	super triggerPreview: aNode.  
		
	previewHandler
		objectBounds: (editorStateList viewport hoveredBounds intersect: editorStateList visibleBounds).