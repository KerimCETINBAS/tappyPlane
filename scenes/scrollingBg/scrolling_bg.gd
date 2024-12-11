extends ParallaxBackground



func _ready() -> void:
	SignalManager.on_plane_died.connect(on_plane_died)
func _process(delta: float) -> void:
	scroll_offset.x -= GameManager.SCROLL_SPEED * delta


func on_plane_died() -> void:
	set_process(false)

func _exit_tree() -> void:
	SignalManager.on_plane_died.disconnect(on_plane_died)
