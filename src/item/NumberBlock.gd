class_name NumberBlock extends ColorRect

var goalPos:Vector2 = Vector2(0,0)
var moveSpeed = 1;

const WHITE = 0;
const GREEN = 1;
const RED = 2;
const YELLOW = 3;

@onready var numberLabel:Label = $CenterContainer/numberLabel
var val:int = 0;

func _process(delta):
	numberLabel.text = str(val)	
	move()

func movingDone()->bool:
	return goalPos == global_position

func setColor(i:int):
	match i:
		WHITE:
			self.color = Color(255,255,255)
		GREEN:
			self.color = Color(0,255,0)
		RED:
			self.color = Color(255,0,0)
		YELLOW:
			self.color = Color(255,255,0)
		_:
			self.color = Color(0,0,0)

func move():
	if(global_position.x < goalPos.x):
		global_position.x += moveSpeed;
		if(global_position.x > goalPos.x):global_position.x = goalPos.x
	elif(global_position.x > goalPos.x):
		global_position.x -= moveSpeed;
		if(global_position.x < goalPos.x):global_position.x = goalPos.x
		
	if(global_position.y < goalPos.y):
		global_position.y += moveSpeed;
		if(global_position.y > goalPos.y):global_position.y = goalPos.y
	elif(global_position.y > goalPos.y):
		global_position.y -= moveSpeed;
		if(global_position.y < goalPos.y):global_position.y = goalPos.y
