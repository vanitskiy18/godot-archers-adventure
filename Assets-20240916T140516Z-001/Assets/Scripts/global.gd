extends Node


var start_pos
var level=1
var keys=0

var lifes=3
var score=0

var current_scene=null

var die=false
var hit=false
var open=false
var change=false

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene('res://Assets-20240916T140516Z-001/Assets/Scenes/Menu.tscn')
		lifes=3
		keys=0
		score=0
	if lifes==-1 and not die:
		get_tree().change_scene('res://Assets-20240916T140516Z-001/Assets/Scenes/Game_over.tscn')
		lifes=3
		keys=0
		score=0
		
func _ready():
	var root=get_tree().get_root()
	current_scene=root.get_child(root.get_child_count()-1)
	
func goto_scene(path):
	get_tree().change_scene(path)
