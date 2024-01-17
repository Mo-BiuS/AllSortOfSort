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
		mainArray.deselectAll()
		mainArray.setColorAll(WHITE)
		mainArray.selectAt(pointer)
		mainArray.selectAt(pointer+1)
		mainArray.setColor(pointer,YELLOW)
		mainArray.setColor(pointer+1,YELLOW)
		waitTime = 0.5
		#=====================================
		if(mainArray.getValue(pointer) > mainArray.getValue(pointer+1)):
			sorted = false
			mainArray.swap(pointer,pointer+1)
		pointer+=1
		#=====================================
		if(pointer == mainArray.getSize()-1):
			if(sorted):
				mainArray.setColorAll(GREEN)
				mainArray.deselectAll()
				main.done()
			else :
				sorted = true
				pointer = 0
