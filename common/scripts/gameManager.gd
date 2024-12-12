extends Node

const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN_MENU: PackedScene = preload("res://scenes/mainMenu/main_menu.tscn")
const SIMPLE_TRANSITION = preload("res://scenes/SimpleTransition/simple_transition.tscn")
const FADE_TRANSITION = preload("res://scenes/FadeTransition/fade_transition.tscn")

const SCROLL_SPEED: float = 120;
const GROUP_PLANE: String = "Plane";

var next_scene: PackedScene

func load_next_scene(ns: PackedScene) -> void:
	next_scene = ns
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
	add_child(FADE_TRANSITION.instantiate())
func load_game_scene() -> void:
	load_next_scene(GAME)

func load_main_menu_scene() ->void:
	load_next_scene(MAIN_MENU)
