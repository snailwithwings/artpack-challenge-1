extends Node2D

var current_scene = "forecastle";
var change_scene = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_scenes():
	if change_scene == true:
		if current_scene == "forecastle":
			get_tree().change_scene_to_file("res://Scenes/world.tscn");

func _on_maindoor_body_entered(body):
	if body.has_method("player"):
		change_scene = true;
		change_scenes();
