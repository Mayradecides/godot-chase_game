extends Node2D

@onready var game_over_ui: CanvasLayer = $GameOverUI

func _ready() -> void:
	# Make sure the game runs normally when restarted
	get_tree().paused = false
	game_over_ui.visible = false
	
	# Allow the UI to still work while the rest of the game is paused
	game_over_ui.process_mode = Node.PROCESS_MODE_ALWAYS

func trigger_game_over() -> void:
	game_over_ui.visible = true
	get_tree().paused = true

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_button_pressed() -> void:
	pass # Replace with function body.
