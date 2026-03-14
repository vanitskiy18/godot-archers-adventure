extends KinematicBody2D

const SPEED = 1500
const FLOOR=Vector2(0,-1)
const GRAVITY=970
var velocity=Vector2()
var direction=1
var alive=true
var flip=true

func kill():
	alive=false
	velocity.x=0
	$AnimatedSprite.play("death")
	$audio_died.play()
	
func _physics_process(delta):
	if alive==true:
		velocity.x=SPEED*delta*direction
		$AnimatedSprite.play("run")
		velocity.y=GRAVITY*delta
		velocity=move_and_slide(velocity,FLOOR)
		if is_on_wall():
			change_direction()
		else:
			flip=true
		
func change_direction():
	if flip:
		$AnimatedSprite.flip_h=!$AnimatedSprite.flip_h
		$Area2D/CollisionShape2D.set_deferred('disabled',!$Area2D/CollisionShape2D.disabled)
		$Area2D/CollisionShape2D2.set_deferred('disabled',!$Area2D/CollisionShape2D2.disabled)
		flip=false
		direction*=-1
		
	
			




func _on_Area2D_body_entered(body):
	if body.name=='Player':
		velocity.x=-SPEED
		velocity=move_and_slide(velocity,FLOOR)
		alive=false
		$AnimatedSprite.play("attack")
		G.lifes-=1
		$audio_attack.play()


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation=='death':
		queue_free()
	if $AnimatedSprite.animation=='attack':
		alive=true
