updating
updateForQuery: query

	| newCols newResizeModes newHorizontalHeaderVisible commandsVisible |
	self
		setProperty: #expandAll
		toValue: (query valueOfProperty: #expandAll ifAbsent: [false]).
	
	newCols := (1 to: query maxPropertyCount) collect: [:idx |
		(UiItemViewSimpleColumnSpec newFrom: (#(text icon color morph balloonText editable selectable)
			collect: [:p | p -> ('{1}_{2}' format: {idx.p}) asSymbol]))
				labelColor: (idx > 1 ifTrue: [Color fromString: #AAAAAA] ifFalse: []);
				yourself].
	newResizeModes := OrderedCollection new.
	commandsVisible := true.
	
	query isHomogeneous
		ifFalse: [newHorizontalHeaderVisible := false]
		ifTrue: [ | wantsHeader |
			wantsHeader := false.
			newCols with: query allPropertySteps do: [:col :prop |
				commandsVisible := commandsVisible and: [prop valueOfProperty: #showCommands ifAbsent: [true]].
				newResizeModes add: ((prop valueOfProperty: #resizeMode) ifNil: [#shrinkWrap]).
				#(headerText headerIcon headerBalloonText) do: [:colProp | col
					perform: (colProp, #:) asSymbol
					with: ((prop valueOfProperty: colProp) ifNotNil: [:val | wantsHeader := true. val])].
				#(hAlignment vAlignment itemOrientation labelColor) do: [:colProp | col
					perform: (colProp, #:) asSymbol
					with: (prop valueOfProperty: colProp)].
				
				(prop valueOfProperty: #selectionMode) ifNotNil: [:sm |
					self currentViews do: [:view | view selectionMode: sm]]].   
			newHorizontalHeaderVisible := wantsHeader].
	
	commandsVisible
		ifTrue: [self showCommandsBar]
		ifFalse: [self hideCommandsBar].
	
	"Update visible changes such as #labelColor, #itemOrientation..."
	self currentViews do: [:view |
		view
			horizontalHeaderVisible: newHorizontalHeaderVisible;
			removeAllColumns;
			rootIsDecorated: query isHomogeneous not | query hasCycle;
			addColumns: newCols.
	
		newResizeModes withIndexDo: [:resizeMode :idx |
			view setResizeModeForColumn: idx to: resizeMode]].