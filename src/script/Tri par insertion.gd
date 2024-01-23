extends Control

var mainArray:ArrayArea
var main

const WHITE = 0;
const GREEN = 1;
const RED = 2;
const YELLOW = 3;

var pointer = 0;
var retPointer = 0;
var waitTime = 0
var returning = false

func solve(delta):
	if(waitTime > 0):waitTime-=delta
	elif(mainArray.movingDone()):
		if(pointer == mainArray.getSize()):
			mainArray.deselectAll()
			mainArray.setColorAll(GREEN)
			main.done()
		else:
			mainArray.deselectAll()
			mainArray.setColorAll(WHITE)
			mainArray.selectAt(pointer)
			if(returning):
				mainArray.selectAt(retPointer)
				mainArray.setColor(pointer,RED)
				mainArray.setColor(retPointer,YELLOW)
			else:
				mainArray.setColor(pointer,GREEN)
			waitTime = 0.5
			
			if(returning):
				if(retPointer == 0):
					if(mainArray.getValue(pointer) < mainArray.getValue(retPointer)):
						mainArray.insert(pointer,retPointer)
					else:
						mainArray.insert(pointer,retPointer+1)
					returning = false
				elif(mainArray.getValue(pointer) < mainArray.getValue(retPointer)):
					retPointer-=1;
				else:
					mainArray.insert(pointer,retPointer+1)
					returning = false
			else:
				if(pointer == 0):
					pointer+=1;
				else:
					if(mainArray.getValue(pointer) < mainArray.getValue(pointer-1)):
						returning = true
						retPointer = pointer-1
					else:
						pointer+=1;
