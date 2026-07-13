extends CanvasLayer


var score : int = 0


func update_score() -> void:
	score += 1
	$ScoreLabel.text = "%d" % score
	
func _on_bird_die() -> void:
	Global.high_score = max(Global.high_score, score)
	$GameOver/CurrentScore.text = "Score: %d" % score
	$GameOver/HighScore.text = "High Score: %d" % Global.high_score
	$GameOver.visible = true
	$ScoreLabel.visible = false
