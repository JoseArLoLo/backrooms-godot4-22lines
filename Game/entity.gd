extends CharacterBody3D
func _physics_process(delta: float) -> void:
	$NavigationAgent3D.target_position = get_tree().get_first_node_in_group("Player").global_position
	look_at(global_position.direction_to($NavigationAgent3D.get_next_path_position()), Vector3.UP, true)
	velocity = Vector3(global_position.direction_to($NavigationAgent3D.get_next_path_position()).x,0,global_position.direction_to($NavigationAgent3D.get_next_path_position()).z)*4
	move_and_slide()
func _on_area_3d_body_entered(body: Node3D) -> void: get_tree().change_scene_to_file("res://Game/main_menu.tscn")
