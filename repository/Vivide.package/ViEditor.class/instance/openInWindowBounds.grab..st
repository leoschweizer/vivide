as yet unclassified
openInWindowBounds: bounds grab: boolean
	"Open in own system window."
	
	| originalColor window extent |	
	"Hide header."
	self eventHandler
		disconnectSignal: #focusReceivedInSubmorph: from: self;
		disconnectSignal: #focusLostInSubmorph: from: self.
	"self header hideFull."
	self header delete.
	
	"Create and show window."
	originalColor := self color.
	window := (ViToolWindow labelled: self headerText) model: self.
	window 
		bounds: bounds;
		addMorph: self frame: (0@0 extent: 1@1);
		setWindowColor: (Color gray: 0.85).
			
	extent := self fullBounds extent + 
			(window borderWidth@window labelHeight) + window borderWidth.
	window extent: extent.
	
	"Move bounds right to currently focused window."
	ViSystemWindow activeWindow ifNotNil: [:tw |
		tw bounds in: [:b |
			b right + window width < ViActiveVivide world right
				ifTrue: [window topLeft: b topRight]]].
	
	ViActiveVivide world addMorph: window.
	window activate.
	ViActiveVivide world startSteppingSubmorphsOf: window.

	"Last cosmetics."
	self color: originalColor.
	self ui panel layoutInset: 0.  
	
	"Window controls."
	self connect: self signal: #closed to: window selector: #delete.

	boolean ifTrue: [
		window setProperty: #initialDrop toValue: true.
		window hasDropShadow: false.
		self currentHand attachMorph: window].
	
	^ window