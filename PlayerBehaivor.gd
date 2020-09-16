extends Area2D

var speed      = 150
var is_dashing = false
var target    :  Vector2
var velocity  := Vector2.ZERO

func _input(event):
	if Input.is_action_just_pressed("Dash"):
		is_dashing = true
		yield(get_tree().create_timer(0.4), "timeout")
		is_dashing = false
	_update_position(get_global_mouse_position())

func _physics_process(delta):
	var mouse_pos = target - global_position
	velocity = mouse_pos.normalized() * speed
	look_at(target)
	if(is_dashing):
		position += velocity * delta * 3
	else:
		position += velocity * delta

func _update_position(mouse_pos:Vector2):
	if !is_dashing:
		target = mouse_pos

#var target = get_global_mouse_position()
#var velocity = position.direction_to(target) * speed
#look_at(target)
#if(get_local_mouse_position().length() > 27):
#	var collision = move_and_collide(velocity)
#	if collision:
#		collision.get_collider().queue_free()
