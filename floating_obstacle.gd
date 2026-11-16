extends AnimatableBody2D

@export var float_distance: float = 20.0
@export var float_speed: float = 2.0

var start_y: float
var time_passed: float = 0.0

func _ready() -> void:
	start_y = position.y
	time_passed = randf() * TAU

func _physics_process(delta: float) -> void:
	time_passed += delta * float_speed
	position.y = start_y + sin(time_passed) * float_distance

func _on_hit_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().current_scene.trigger_game_over()
