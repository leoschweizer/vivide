as yet unclassified
update

	self pane ifNil: [self delete. ^ self].
	
	self bounds: (self pane bounds outsetBy: 3) .
	
	self world
		ifNil: [self openInWorld]
		ifNotNil: [:w | self comeToFront].