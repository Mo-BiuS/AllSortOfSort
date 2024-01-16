extends Control

var mainArray:ArrayArea
var main

var state = 0;
const PARSE = 0;

const WHITE = 0;
const GREEN = 1;
const RED = 2;
const YELLOW = 3;

var pointer = 0;
var waitTime = 0

func solve(delta):
	if(waitTime > 0):waitTime-=delta
	elif(mainArray.movingDone()):
		if(pointer == 0 && mainArray.getSize() > 0):
			mainArray.setColor(0,GREEN)
			pointer+=1;
			waitTime = 0.5
		elif(pointer < mainArray.getSize()):
			if(mainArray.getValue(pointer) < mainArray.getValue(pointer-1)):
				mainArray.setColor(pointer,YELLOW)
				mainArray.setColor(pointer-1,YELLOW)
				mainArray.swap(pointer,pointer-1)
				pointer-=1;
			else:
				mainArray.setColor(pointer,GREEN)
				pointer+=1;
				waitTime = 0.5
		else:
			main.done()
