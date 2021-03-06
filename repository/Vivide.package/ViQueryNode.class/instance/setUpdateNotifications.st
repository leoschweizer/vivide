notifications
setUpdateNotifications

	| refObjects |
	self firstStep ifNotNil: [:f |
		self flag: #missing. "mt: What about intermediate objects?"
		refObjects := f process: #() within: nil.
		
		f nextStepsDo: [:step |
			(step objectNotifiersWith: refObjects) do: [:notifier |
				self updateNotifiers add: notifier.
				notifier subscribe.
				self
					connect: notifier signal: #notifyEvent:
					toSelector: #onEvent:fromNotifier:inStep: pattern: {1. 0. #=. step}]]].