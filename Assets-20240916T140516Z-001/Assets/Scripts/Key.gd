extends Area2D





func _on_Key_body_entered(body):
	if body.name=='Player':
		G.keys+=1
		$CollisionShape2D.queue_free()
		$Sprite.queue_free()
		$AudioStreamPlayer2D.play()
		


func _on_AudioStreamPlayer2D_finished():
	queue_free()
