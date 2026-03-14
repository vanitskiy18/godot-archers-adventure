extends Area2D


const Key=preload("res://Assets-20240916T140516Z-001/Assets/Scenes/Key.tscn")


func _ready():
	$AnimatedSprite.play('anim')
	
func open():
	$AnimatedSprite.play("unpack")
	$CollisionShape2D.queue_free()
	$Static_box.queue_free()
	$AudioStreamPlayer2D.play()


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation=='unpack':
		var k=Key.instance()
		k.position=position
		get_parent().add_child(k)
