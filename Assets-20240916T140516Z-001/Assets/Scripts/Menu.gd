extends Node2D







func _on_Info_pressed():
	$Info.show()
	
	



func _on_Exit_pressed():
	get_tree().quit()
	
	



func _on_Play_pressed():
	get_tree().change_scene("res://Assets-20240916T140516Z-001/Assets/Scenes/Level1.tscn")
