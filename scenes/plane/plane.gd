class_name Tappy
extends CharacterBody2D



const gravity: float = 600.0
const power: float = -200.0



@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var engine_sound: AudioStreamPlayer2D = $EngineSound

func _ready(): 
	pass
	
func _process(delta: float) -> void:
	pass
	

func _physics_process(delta: float) -> void: 
	
	velocity.y += gravity * delta
	
	move_and_slide()
	
	if is_on_floor():
		die()
	pass


func die() -> void:
	animatedSprite2D.stop()
	engine_sound.stop()
	set_physics_process(false)
	SignalManager.on_plane_died.emit()

func _input(event: InputEvent) -> void:
	if event.is_action("Fly"):
		velocity.y = power
		animationPlayer.play("power")
