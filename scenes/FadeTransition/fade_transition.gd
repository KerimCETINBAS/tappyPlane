class_name FadeTransition
extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	animation_player.animation_finished.connect(on_animation_finish)
	
func switch_scene() -> void:
	get_tree().change_scene_to_packed(GameManager.next_scene)

func on_animation_finish(anim: StringName) -> void:
	queue_free()

func _exit_tree() -> void:
	animation_player.animation_finished.disconnect(on_animation_finish)
