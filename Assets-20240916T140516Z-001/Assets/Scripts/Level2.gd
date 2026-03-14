extends Node2D


func _ready():
	G.start_pos=$Position2D.position
	$Player.position=G.start_pos


func _process(delta):
	if $Player.position.y>600:
		G.die=true
