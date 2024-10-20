extends Node

var player_stats = {
	"health": 100,
	"abilities": [],
	"position": Vector2.ZERO
}

func save_game():
	var save_data = {
		"player_stats": player_stats,
		"current_level": LevelManager.current_level_path
	}
	var file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	file.store_var(save_data)
	file.close()

func load_game():
	if FileAccess.file_exists("user://savegame.save"):
		var file = FileAccess.open("user://savegame.save", FileAccess.READ)
		var save_data = file.get_var()
		file.close()
		player_stats = save_data["player_stats"]
		LevelManager.load_level(save_data["current_level"])
