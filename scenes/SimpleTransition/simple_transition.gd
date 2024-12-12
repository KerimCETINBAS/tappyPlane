extends Control

@onready var timer: Timer = $Timer


func _ready() -> void:
	timer.timeout.connect(on_timer_timeout)


func on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(GameManager.next_scene)


func _exit_tree() -> void:
	timer.timeout.disconnect(on_timer_timeout)
