extends KinematicBody2D

#CONSTS 
var run_speed = 350
var jump_speed = -800
var gravity = 3200

#Var status player
var velocity = Vector2(0,0)
var doubleJump = true

#Animation Only
var auxAnimationDoubleJump = 0
var lado = 'dir'

func _ready():
	
	pass 


func _process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity, Vector2(0, -1))

func get_input(delta):
	velocity.x=0;
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')
	var down = Input.is_action_just_pressed('ui_down')
	var onFloor = is_on_floor()
	var auxJump = doubleJump
	
	#Down increment speed
	if down and !onFloor:
		velocity.y += gravity*delta*30;
	else:
		velocity.y += gravity*delta;
		
	#Right and left controll
	if left:
		velocity.x-=run_speed
	if right:
		velocity.x+=run_speed
	
	#Double jump
	if onFloor:
		doubleJump=true;
		if jump:
			velocity.y=jump_speed
	else: if jump and doubleJump:
		velocity.y=jump_speed
		doubleJump=false;
		auxAnimationDoubleJump=6
	
	if velocity.x>0 and lado=='esq':
		scale.x=-1
		lado='dir'
	else: if velocity.x<0 and lado=='dir':
		scale.x=-1
		lado='esq'
	
	if auxAnimationDoubleJump>0:
		auxAnimationDoubleJump=auxAnimationDoubleJump-1
		$AnimatedSprite.animation="ocioso"
	else: if !is_on_floor():
		$AnimatedSprite.animation="pulando"
	else: if velocity.x!=0:
		$AnimatedSprite.animation="correndo"
	else:
		$AnimatedSprite.animation="ocioso"
