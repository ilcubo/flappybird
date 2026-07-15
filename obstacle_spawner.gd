extends Node2D


var obstacle_scene : PackedScene = preload("res://obstacle.tscn")

func _ready() -> void:
	if Global.has_played:
		$Timer.autostart = true
		$Timer.start()


func _on_timer_timeout() -> void:
	var obstacle : Node2D = obstacle_scene.instantiate();
	obstacle.position.y += randf_range(0, 1000)
	add_child(obstacle)


func _on_bird_die() -> void:
	$Timer.paused = true


func _on_interface_start_game() -> void:
	$Timer.autostart = true
	$Timer.start()
