extends CanvasLayer

func _ready():
	$HSplitContainer/Buttons/Play.connect("pressed", Callable(self, "_on_Play_pressed"))
	$HSplitContainer/Buttons/Options.connect("pressed", Callable(self, "_on_Options_pressed"))
	$HSplitContainer/Buttons/Quit.connect("pressed", Callable(self, "_on_Quit_pressed"))

func _on_Play_pressed():
	LevelManager.load_next_level()

func _on_Options_pressed():
	# Implement options menu logic
	pass

func _on_Quit_pressed():
	get_tree().quit()
