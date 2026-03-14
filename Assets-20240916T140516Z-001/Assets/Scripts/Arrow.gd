extends Area2D


const SPEED=500
var velocity=Vector2()
var direction=1

func _physics_process(delta):
	if direction==-1:
		$Sprite.flip_h=true
	velocity.x=SPEED*delta*direction
	translate(velocity)

func _on_VisibilityNotifier2D_screen_exited():
	
	queue_free()


func _on_Arrow_area_entered(area):
	if 'Box' in area.name:
		area.open()
		queue_free()


func _on_Arrow_body_entered(body):
	if 'Enemy' in body.name:
		body.kill()
		queue_free()
