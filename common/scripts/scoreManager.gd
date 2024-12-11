extends Node

const SCORE_PATH = "user://score.dat"


func _ready() -> void:
	load_high_score()

var score: int = 0:
	get:
		return score
	set(value):
		score = max(value, 0)
		SignalManager.on_score_updated.emit(value)
		
var high_score: int = 0:
	get:
		return high_score
	set(value):
		if value > high_score:
			high_score = max(value, 0)

func incrementScore() -> void: 
	score += 1
	high_score = score
	
func load_high_score() -> void: 
	var file: FileAccess = FileAccess.open(SCORE_PATH, FileAccess.READ)
	if !file:
		return
	high_score = file.get_32()
	file.close()

func save_high_score() -> void:
	var file: FileAccess = FileAccess.open(SCORE_PATH, FileAccess.WRITE)
	if !file:
		return
	file.store_32(high_score)
	file.close()
