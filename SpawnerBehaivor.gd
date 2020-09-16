extends Node2D

var player
onready var enemy_template = preload("res://Minion 1/EnemyScene.tscn")

func _on_Timer_timeout():
	var enemy:Sprite = enemy_template.instance()
	enemy.player = player
	enemy.set_position(global_position) 
	get_parent().add_child(enemy)
