extends Node2D

@onready var game_over_ui: CanvasLayer = $GameOverUI
var restart_button: Button

func _ready() -> void:
	get_tree().paused = false
	game_over_ui.visible = false
	game_over_ui.process_mode = Node.PROCESS_MODE_ALWAYS
	
	# Automatically find the Button inside GameOverUI regardless of its name or nesting
	restart_button = game_over_ui.find_child("*", true, false) as Button
	for child in game_over_ui.find_children("*", "Button", true, false):
		restart_button = child
		break
	
	if restart_button != null:
		restart_button.process_mode = Node.PROCESS_MODE_ALWAYS
		if not restart_button.pressed.is_connected(_on_restart_button_pressed):
			restart_button.pressed.connect(_on_restart_button_pressed)
	else:
		push_warning("No Button node found inside GameOverUI!")

func trigger_game_over() -> void:
	game_over_ui.visible = true
	if restart_button != null:
		restart_button.grab_focus()
	get_tree().paused = true

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_button_pressed() -> void:
	pass # Replace with function body.
