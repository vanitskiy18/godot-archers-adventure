extends Area2D





func _on_Coin_body_entered(body):
	if body.name=='Player':
		G.score+=1
		$CollisionShape2D.queue_free()
		$AnimatedSprite.queue_free()
		$AudioStreamPlayer2D.play()




func _on_AudioStreamPlayer2D_finished():
	queue_free()
