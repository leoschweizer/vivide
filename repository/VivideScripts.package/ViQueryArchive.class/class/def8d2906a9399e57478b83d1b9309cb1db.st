definitions
def8d2906a9399e57478b83d1b9309cb1db
	<definition>

	^ ((Dictionary new) add: (#class->ViQueryStepDefinition); add: (#properties->((Dictionary new) add: (#creationAuthor->'mt'); add: (#creationTimeStamp->'20 May 2015 10:56:21 pm'); yourself)); add: (#id->#'8d2906a9-399e-5747-8b83-d1b9309cb1db'); add: (#block->[:in :out | (
	[:objects | objects collect: [:experiment | experiment]]
		value: in) do: [:result |
			(ViQueryInterpreter isCollection: result)
				ifTrue: [out addAll: result]
				ifFalse: [out add: result]]]); add: (#sourceCode->'[:in :out | (
	[:objects | objects collect: [:experiment | experiment]]
		value: in) do: [:result |
			(ViQueryInterpreter isCollection: result)
				ifTrue: [out addAll: result]
				ifFalse: [out add: result]]]'); yourself)