extends Control

var mainArray:ArrayArea
var main

const WHITE = 0;
const GREEN = 1;
const RED = 2;
const YELLOW = 3;

const WAIT_TIME = 0.5

var pointer = 0;
var parsed = 0;
var minValue = -100
var minPos = 0
var waitTime = 0
var returning = false

func solve(delta):
	if(waitTime > 0):waitTime-=delta
	elif(mainArray.movingDone()):
		mainArray.deselectAll()
		mainArray.setColorAll(WHITE)
		for i in range(0,parsed) :
			mainArray.setColor(i,GREEN)
		if(pointer < mainArray.getSize()):mainArray.setColor(pointer,YELLOW)
		if(minPos < mainArray.getSize()):mainArray.setColor(minPos,RED)
		waitTime = WAIT_TIME
		
		if(parsed < mainArray.getSize()):
			if(pointer == parsed):
				minPos = pointer
				minValue = mainArray.getValue(pointer)
				pointer+=1
			elif(pointer == mainArray.getSize()):
				mainArray.insert(minPos,parsed)
				parsed+=1;
				pointer = parsed;
			else:
				if  mainArray.getValue(pointer) < minValue:
					minValue = mainArray.getValue(pointer)
					minPos = pointer
				pointer+=1;
		else:
			mainArray.deselectAll()
			mainArray.setColorAll(GREEN)
			main.done()
