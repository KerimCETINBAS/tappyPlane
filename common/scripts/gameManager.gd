extends Node

const GAME: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN_MENU: PackedScene = preload("res://scenes/mainMenu/main_menu.tscn")

const OFF_SCREEN_THRESHOLD: float = -500;
const SCROLL_SPEED: float = 120;
const GROUP_PLANE: String = "Plane";


func load_game_scane() -> void:
	get_tree().change_scene_to_packed(GAME)

func load_main_menu_scene() ->void:
	get_tree().change_scene_to_packed(MAIN_MENU)
