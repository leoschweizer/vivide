as yet unclassified
initializeForSingleSelection

	self removeAllMorphs.
	
	selectionMap := nil.
	
	self
		addMorph: ((PluggableListMorphPlus
			on: self
			list: #list
			selected: #currentSelectionIndex
			changeSelected: #currentSelectionIndex:)
				getIconSelector: #iconAtIndex:;
				dragItemSelector: #dragPassengerAtIndex:;
				dragTypeSelector: #dragTransferTypeAtIndex:;
				dragEnabled: true;
				autoDeselect: false;
				yourself).