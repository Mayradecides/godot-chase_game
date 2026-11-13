extends CharacterBody2D

@export var speed: float = 210.0 # Slightly slower than the player so escape is possible
@export var target: Node2D

func _physics_process(_delta: float) -> void:
	if target == null:
		return
	
	# Calculate direction vector pointing from the enemy toward the player
	var direction := global_position.direction_to(target.global_position)
	velocity = direction * speed
	move_and_slide()

func _on_catch_area_body_entered(body: Node2D) -> void:
	if body == target:
		# Reload the current scene when caught
		get_tree().call_deferred("reload_current_scene")


func _on_catcharea_body_entered(body: Node2D) -> void:
	if body == target:
		get_tree().call_deferred("reload_current_scene")
