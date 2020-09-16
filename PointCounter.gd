extends Label

var points = 0

func _on_update():
	points += 10
	set_text("Points: " + str(points))
