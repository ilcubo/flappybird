extends Node2D


var obstacle_scene : PackedScene = preload("res://obstacle.tscn")


func _on_timer_timeout() -> void:
	var obstacle : Node2D = obstacle_scene.instantiate();
	obstacle.position.y += randf_range(0, 1000)
	add_child(obstacle)
	
