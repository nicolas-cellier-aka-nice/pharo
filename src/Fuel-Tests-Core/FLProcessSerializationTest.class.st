Class {
	#name : #FLProcessSerializationTest,
	#superclass : #FLBasicSerializationTest,
	#category : 'Fuel-Tests-Core-Base'
}

{ #category : #running }
FLProcessSerializationTest >> setUpSerializer [
	^ serializer := FLDelayedSerializerMock newDefault
]

{ #category : #tests }
FLProcessSerializationTest >> testSerializingShortDelay [
	| process |
	process := [ 2 timesRepeat: [ | d |
		d := Delay forMilliseconds: 50.
		d wait ] ] forkAt: Processor userBackgroundPriority.
	
	self 
		shouldnt: [ self serialize: process ]
		raise: FLObjectNotFound
]
