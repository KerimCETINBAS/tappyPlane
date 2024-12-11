extends Control

@onready var label: Label = $Label

func _ready() -> void:
	SignalManager.on_score_updated.connect(on_score_updated)
	
func on_score_updated(score: int) -> void:
	label.text = str(score)

func _exit_tree() -> void:
	SignalManager.on_score_updated.disconnect(on_score_updated)
