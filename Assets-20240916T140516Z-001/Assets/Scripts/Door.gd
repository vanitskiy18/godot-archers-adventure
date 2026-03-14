extends Area2D


func _process(delta):
	if G.level==1:
		if G.keys==5:
			$AnimatedSprite.play("opened")
		else:
			$AnimatedSprite.play("closed")
	elif G.level==2:
		if G.keys==3:
			$AnimatedSprite.play("opened")
		else:
			$AnimatedSprite.play("closed")
			


func _on_Door_body_entered(body):
	if body.name=='Player' and ((G.keys==5 and G.level==1) or (G.keys==3 and G.level==2)):
		$AudioStreamPlayer2D.play()
		
		
		



func _on_AudioStreamPlayer2D_finished():
	G.level+=1
	G.keys=0
	if G.level!=3:
		G.goto_scene('res://Assets-20240916T140516Z-001/Assets/Scenes/Level'+str(G.level)+'.tscn')
	else:
		G.goto_scene('res://Assets-20240916T140516Z-001/Assets/Scenes/The_end.tscn')
		G.level=1
