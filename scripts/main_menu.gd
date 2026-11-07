extends Control
class_name MainMenu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_exit_button_pressed() -> void:
	#Finaliza a cena
	get_tree().quit();

func _on_new_game_button_pressed() -> void:
	# Permite trocar de cena
	get_tree().change_scene_to_file("res://scenes/levels/level01.tscn")
