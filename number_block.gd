extends ColorRect 

var goalPos:Vector2 = Vector2(0,0)
var MOVE_SPEED = 1;

@onready var numberLabel:Label = $CenterContainer/numberLabel
var val:int = 0;

func _process(delta):
	numberLabel.text = str(val)	
	move()

func move():
	if(global_position.x < goalPos.x):
		global_position.x += MOVE_SPEED;
		if(global_position.x > goalPos.x):global_position.x = goalPos.x
	elif(global_position.x > goalPos.x):
		global_position.x -= MOVE_SPEED;
		if(global_position.x < goalPos.x):global_position.x = goalPos.x
		
	if(global_position.y < goalPos.y):
		global_position.y += MOVE_SPEED;
		if(global_position.y > goalPos.y):global_position.y = goalPos.y
	elif(global_position.y > goalPos.y):
		global_position.y -= MOVE_SPEED;
		if(global_position.y < goalPos.y):global_position.y = goalPos.y
