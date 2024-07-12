extends Node2D

var current_scene = "world";
# bc obv we dont wanna change scene right away L
var change_scene = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.last_world_position != Vector2(0,0):
		$TileMap/player.position = Global.last_world_position + Vector2(0, 5);

func _on_foredoor_body_entered(body):
	if body.has_method("player"):
		Global.last_world_position = $TileMap/player.position;
		change_scene = true;
		change_scenes();

func change_scenes():
	if change_scene == true:
		if current_scene == "world":
			get_tree().change_scene_to_file("res://Scenes/forecastle.tscn");

