class_name Bird
extends CharacterBody2D


signal die

const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var collision : KinematicCollision2D = get_last_slide_collision()
	if collision != null:
		Global.game_speed = 0
		emit_signal("die")
		queue_free()
		
	# Add the gravity.
	if not is_on_floor() and Global.has_played:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()
