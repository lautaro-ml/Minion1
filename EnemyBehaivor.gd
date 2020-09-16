extends Sprite

var player
var speed = 160
var friction = 0.95
var target := Vector2.ZERO
var velocity := Vector2.ZERO

func _process(delta):
	target = player.global_position - global_position
	velocity += target
	velocity *= friction
	look_at(player.global_position)
	position += velocity.normalized() * speed * delta

func _on_Timer_timeout():
	get_parent().remove_child(self)
	queue_free()

func _on_EnemyArea_area_entered(area):
	area.hide()
	get_parent().game_over()
