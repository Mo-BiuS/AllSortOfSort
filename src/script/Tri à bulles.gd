extends Control

var mainArray:ArrayArea
var main

const WHITE = 0;
const GREEN = 1;
const RED = 2;
const YELLOW = 3;

var pointer = 0;
var waitTime = 0
var sorted = true

func solve(delta):
	if(waitTime > 0):waitTime-=delta
	elif(mainArray.movingDone()):
		if(pointer == 0 && mainArray.getSize() > 0):
			mainArray.deselectAll()
			mainArray.setColor(0,GREEN)
			mainArray.selectAt(0)
			pointer+=1;
			waitTime = 0.5
		elif(pointer < mainArray.getSize()):
			mainArray.deselectAt(pointer-1)
			mainArray.selectAt(pointer)
			if(mainArray.getValue(pointer) < mainArray.getValue(pointer-1)):
				mainArray.swap(pointer,pointer-1)
				if(sorted):
					mainArray.setColorAll(WHITE)
					sorted = false
			else:
				if(sorted):mainArray.setColor(pointer,GREEN)
				pointer+=1;
				waitTime = 0.5
		else:
			if(sorted):
				mainArray.deselectAll()
				main.done()
			else: 
				pointer = 0
				sorted = true
