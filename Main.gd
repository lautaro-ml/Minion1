extends Node2D

onready var point_template   = preload("res://Minion 1/Point.tscn")
onready var spawner_template = preload("res://Minion 1/Spawner.tscn")

func _ready():
	spawn_points(10)
	set_spawners(3)

func game_over():
	get_tree().reload_current_scene()

func spawn_points(n):
	for i in range(n):
		var point:Area2D = point_template.instance()
		point.point_counter = $Label
		point.set_position(random_position()) 
		add_child(point)
		
func set_spawners(n):
	for i in range(n):
		var spawner:Node2D = spawner_template.instance()
		spawner.player = $Player
		spawner.set_position(random_position()) 
		add_child(spawner)
		
func random_position():
	return(Vector2(random_x(), random_y()))
	
func random_x():
	return rand_range(-103, 916)

func random_y():
	return rand_range(-52, 543)


func _on_Timer_timeout():
	spawn_points(3)
