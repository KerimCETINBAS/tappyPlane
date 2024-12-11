extends Control

@onready var sound: AudioStreamPlayer = $Sound
@onready var timer: Timer = $Timer
@onready var space_label: Label = $SpaceLabel
@onready var game_over_label: Label = $GameOverLabel


func _ready() -> void:
	
	# hide self
	hide()
	# subscribe to timer.timeout signal
	SignalManager.on_plane_died.connect(on_plane_died)
	
	
func _on_timer_timeout() -> void:
	game_over_label.hide()
	space_label.show()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Fly") and space_label.visible:
		GameManager.load_main_menu_scene()

func on_plane_died() -> void:
	show()
	timer.timeout.connect(_on_timer_timeout)
	ScoreManager.save_high_score()
	timer.start()
	sound.play()
	
	
func _exit_tree() -> void:
	timer.timeout.disconnect(_on_timer_timeout)
