class_name SceneTrigger extends Area2D
@export var connected_scene: String
var scene_root = "res://"




func _on_body_entered(body):
	var full_path = scene_root + connected_scene + ".tscn"
	var scene_tree = get_tree()
	scene_tree.change_scene_to_file(full_path)
