extends ParallaxLayer

const IMG_WIDTH: float = 1920
const IMG_HEIGHT: float = 1080

@onready var sprite_2d: Sprite2D = $Sprite2D


@export var texture: Texture2D
@export var scrollScale: float = 0


func _ready() -> void:
	motion_scale.x = scrollScale
	var scale_f = get_viewport_rect().size.y / IMG_HEIGHT
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_f, scale_f)
	motion_mirroring.x = IMG_WIDTH * scale_f
