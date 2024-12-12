extends Parallax2D


@onready var sprite_2d: Sprite2D = $Sprite2D
@export var texture: Texture2D
@export var scrollScale: float = 0


# set bg
func _ready() -> void:
	var scale_f = get_viewport_rect().size.y / texture.get_height()
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_f, scale_f)
	repeat_size.x = texture.get_width() * scale_f
	SignalManager.on_plane_died.connect(on_plane_died)


# scroll bg at every frame
func _process(delta: float) -> void:
	screen_offset.x += delta * GameManager.SCROLL_SPEED

# stop scrolling on plane died
func on_plane_died() -> void:
	set_process(false)

func _exit_tree() -> void:
	SignalManager.on_plane_died.disconnect(on_plane_died)
