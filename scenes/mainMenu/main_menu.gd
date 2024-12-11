extends Control

@onready var high_score_score: Label = $MarginContainer/HighScoreScore


func _ready() -> void:
	high_score_score.text ="%04d" % ScoreManager.high_score

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Fly"):
		GameManager.load_game_scane()
