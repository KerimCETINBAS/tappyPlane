class_name Pipes
extends Node2D

@onready var upper: Area2D = $Upper
@onready var lower: Area2D = $Lower
@onready var laser: Area2D = $Laser
@onready var score_sound: AudioStreamPlayer = $ScoreSound

func _ready() -> void: 
	SignalManager.on_plane_died.connect(on_plane_died)
	# subscribe the body_entered signal on both pipes
	upper.body_entered.connect(_on_pipe_body_entered)
	lower.body_entered.connect(_on_pipe_body_entered)
	# subscribe the body_enterd signal on laser
	laser.body_entered.connect(_on_laser_body_entered)

func _process(delta: float) -> void:
	position.x -= delta * GameManager.SCROLL_SPEED
	# if _on_screen_exited() 
	# is not emmited for some reason
	# remove it manuelly
	if _is_off_screen():
		queue_free()

# delete self if its off the screen
func _on_screen_exited() -> void:
	queue_free()


# check if pipe off the screen
func _is_off_screen() -> bool:
	return position.x < GameManager.OFF_SCREEN_THRESHOLD
	

func on_plane_died() -> void:
	set_process(false)

# closure for on_body_entered signal on pipe
func _on_pipe_body_entered(body: Node2D) -> void:
	# kill plane if body in group "Plane" and is type of Tappy
	if body.is_in_group(GameManager.GROUP_PLANE) and body is Tappy:
			(body as Tappy).die()
	

func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		score_sound.play()
		ScoreManager.incrementScore()
		
# cleanup subscriptions
func _exit_tree() -> void:
	SignalManager.on_plane_died.disconnect(on_plane_died)
	# subscribe the body_entered signal on both pipes
	upper.body_entered.disconnect(_on_pipe_body_entered)
	lower.body_entered.disconnect(_on_pipe_body_entered)
	# subscribe the body_enterd signal on laser
	laser.body_entered.disconnect(_on_laser_body_entered)
