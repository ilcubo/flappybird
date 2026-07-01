extends Label


var score : int = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0
	text = "0"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var obstacles = get_tree().get_nodes_in_group("obstacles")
	for obstacle in obstacles:
		obstacle.scored.connect(_on_scored)


func _on_scored() -> void:
	score = score + 1
	print(score)
	text = "{}".format([score], "{}")
