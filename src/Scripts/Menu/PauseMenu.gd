extends CanvasLayer

func _ready():
	$Buttons/Resume.connect("pressed", Callable(self, "_on_Resume_pressed"))
	$Buttons/Options.connect("pressed", Callable(self, "_on_Options_pressed"))
	$Buttons/Quit.connect("pressed", Callable(self, "_on_Quit_pressed"))

func _on_Resume_pressed():
	get_tree().paused = false
	hide()

func _on_Options_pressed():
	# Implement options logic
	pass

func _on_Quit_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
