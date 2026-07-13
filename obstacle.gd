extends Node2D


@export var velocity : float = 250;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.translate(velocity * Global.game_speed * Vector2.LEFT * delta)
	if global_position.x < -100:
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Bird:
		get_tree().call_group("interface", "update_score")
