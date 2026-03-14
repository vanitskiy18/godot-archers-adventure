extends KinematicBody2D

const SPEED=100
const FLOOR=Vector2(0,-1)
const GRAVITY=10
const JUMP_POWER=250


var velocity=Vector2()

const Arrow=preload("res://Assets-20240916T140516Z-001/Assets/Scenes/Arrow.tscn")

func _ready():
	if G.level==1:
		$Camera2D.limit_bottom=400
	elif G.level==2:
		$Camera2D.limit_bottom=800
	$AnimatedSprite.play("Idle")
	set_physics_process(true)

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		$AnimatedSprite.play("Attack")
	elif G.die:
		$AnimatedSprite.play("Death")
		$Node2D/Died.play()
	elif G.lifes==0:
		$AnimatedSprite.play("Death")
		set_physics_process(false)
	else:
		if Input.is_action_pressed('ui_right'):
			velocity.x=SPEED
			$AnimatedSprite.flip_h=false
			if is_on_floor():
				$AnimatedSprite.play('Run')
		elif Input.is_action_pressed('ui_left'):
			velocity.x=-SPEED
			$AnimatedSprite.flip_h=true
			if is_on_floor():
				$AnimatedSprite.play('Run')
		else:
			velocity.x=0
			if is_on_floor():
				$AnimatedSprite.play("Idle")
		if Input.is_action_pressed("ui_up") and is_on_floor():
			velocity.y=-JUMP_POWER
			$AnimatedSprite.play("Jump and Fall")
			$Node2D/Jump.play()
		if is_on_floor():
			$Node2D/Jump.stop()
		velocity.y+=(GRAVITY+delta)
		
	
		velocity=move_and_slide(velocity,FLOOR)
			



func _on_AnimatedSprite_animation_finished():
	if  $AnimatedSprite.animation=='Death':
		G.lifes-=1
		position=G.start_pos
		G.die=false
	if $AnimatedSprite.animation=='Attack':
		var ARROW=Arrow.instance()
		
		if $AnimatedSprite.flip_h:
			ARROW.direction=-1
		else:
			ARROW.direction=1
		ARROW.position=$Position2D.global_position
		get_parent().add_child(ARROW)
		
