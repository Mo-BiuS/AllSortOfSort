extends ColorRect

var Y_POS = 60
var X_POS = 400
var goalSize:Vector2 = Vector2(420,60)
var goalPos:Vector2 = Vector2(400,Y_POS)
var GROW_SPEED = 1.5;
var MOVE_SPEED = 1;

func _ready():
	position = goalPos

func _process(delta):
	#goalSize = Vector2i(20+get_child_count()*50,60)
	grow()
	goalPos = Vector2(X_POS-size.x/2,Y_POS-size.y/2)
	move()
	moveChildren()

func grow():
	if(size.x < goalSize.x):
		size.x += GROW_SPEED;
		if(size.x > goalSize.x):size.x = goalSize.x
	elif(size.x > goalSize.x):
		size.x -= GROW_SPEED;
		if(size.x < goalSize.x):size.x = goalSize.x
		
	if(size.y < goalSize.y):
		size.y += GROW_SPEED;
		if(size.y > goalSize.y):size.y = goalSize.y
	elif(size.y > goalSize.y):
		size.y -= GROW_SPEED;
		if(size.y < goalSize.y):size.y = goalSize.y
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
func moveChildren():
	for i in get_child_count():
		get_children()[i].goalPos.x = 10+global_position.x+(size.x-10)*i/get_child_count()
		get_children()[i].goalPos.y = 10+global_position.y

func shuffle()->Array:
	var rep:Array;
	var child = get_children()
	child.shuffle()
	clear()
	for i in child:
		rep.append(i.val)
		add_child(i)
	return rep

func clear():
	for i in get_children():
		remove_child(i)
