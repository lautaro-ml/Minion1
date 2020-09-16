extends Area2D

var point_counter

func _ready():
	connect("tree_exiting", point_counter, "_on_update")

func _on_Point_area_entered(area):
	queue_free()
