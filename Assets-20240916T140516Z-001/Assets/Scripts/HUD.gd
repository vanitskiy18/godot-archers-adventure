extends CanvasLayer


func _process(delta):
	$HP.animation=str(G.lifes)
	$Label_keys.text='x '+str(G.keys)
	$Label_coins.text='x '+str(G.score)
