extends Node2D

const pipes: PackedScene = preload("res://scenes/pipes/pipes.tscn")
@onready var spawn_upper: Marker2D = $Spawn/SpawnUpper
@onready var spawn_lower: Marker2D = $Spawn/SpawnLower
@onready var spawn_timer: Timer = $Spawn/SpawnTimer
@onready var spawn: Node = $Spawn
@onready var pipe_holder: Node = $PipeHolder


func _ready() -> void:
	ScoreManager.score = 0
	# subscribe spawn_timer.timeout signal
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	# subscribe on_plane_died signal
	SignalManager.on_plane_died.connect(_on_plane_died)
	# spawn pipes on the scene
	spawn_pipes()


#  helper method that spawn pipes on the game scene periodically
func spawn_pipes() -> void:
	var new_pipes: Pipes = pipes.instantiate()
	var yPosition: float = randf_range(spawn_upper.position.y, spawn_lower.position.y)
	new_pipes.position = Vector2(spawn_lower.position.x, yPosition)
	pipe_holder.add_child(new_pipes)

# closure for spawn_timer.timeout signal
func _on_spawn_timer_timeout() -> void:
	spawn_pipes()


func _on_plane_died() -> void:
	spawn_timer.stop()
	# disconnect timer to prevent memory allocation
	spawn_timer.timeout.disconnect(_on_spawn_timer_timeout)
