class_name ArrayArea extends ColorRect

var Y_POS = 60
var X_POS = 400
var goalSize:Vector2 = Vector2(420,60)
var goalPos:Vector2 = Vector2(400,Y_POS)
var GROW_SPEED = 1.5;
var MOVE_SPEED = 1;

var numberBlock = preload("res://src/item/NumberBlock.tscn")

func _ready():
	position = goalPos

func _process(delta):
	#goalSize = Vector2i(20+get_child_count()*50,60)
	grow()
	goalPos = Vector2(X_POS-size.x/2,Y_POS-size.y/2)
	move()
	moveChildren()

func movingDone()->bool:
	var childDone = true;
	for i in get_children():
		if i is NumberBlock: childDone = childDone && i.movingDone()
	return childDone && goalPos == global_position && goalSize == size

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
		get_children()[i].goalPos.x = -15+global_position.x+(size.x-10)*i/get_child_count()+size.x/2/get_child_count()
		get_children()[i].goalPos.y = 10+global_position.y

func swap(i,j):
	move_child(get_children()[i],j)

func setSpeed(val:float):
	for i in get_children():
		if i is NumberBlock:
			i.moveSpeed = val

func shuffle():
	var child = get_children()
	child.shuffle()
	clear()
	for i in child:
		i.setColor(0)
		add_child(i)

func clear():
	for i in get_children():
		remove_child(i)

func getSize()->int:
	return get_child_count()
func getValue(at:int)->int:
	return get_children()[at].val
func addNumber(val:int):
	var nb:NumberBlock = numberBlock.instantiate()
	nb.val = val
	add_child(nb)
	nb.global_position = Vector2(global_position.x+size.x-5-nb.size.x,10+global_position.y)

#=========================================
func setColorAll(val:int):
	for i in get_children():i.setColor(val)
func setColor(at:int, val:int):
	get_children()[at].setColor(val)
#=========================================
func deselectAll():
	for i in get_children():i.deselect()
func selectAll():
	for i in get_children():i.select()
func deselectAt(at:int):
	get_children()[at].deselect()
func selectAt(at:int):
	get_children()[at].select()
