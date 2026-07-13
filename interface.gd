extends CanvasLayer


var score : int = 0


func update_score() -> void:
	score += 1
	$ScoreLabel.text = "%d" % score
	
func clear_score() -> void:
	score = 0
	$ScoreLabel.text = "0"
	
func _on_bird_die() -> void:
	Global.high_score = max(Global.high_score, score)
	$GameOver/CurrentScore.text = "Score: %d" % score
	$GameOver/HighScore.text = "High Score: %d" % Global.high_score
	$GameOver.visible = true
	$ScoreLabel.visible = false

func _on_button_pressed() -> void:
	clear_score()
	$GameOver.visible = false
	$ScoreLabel.visible = true
	Global.game_speed = 1.0
	get_tree().reload_current_scene()
