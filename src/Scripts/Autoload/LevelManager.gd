extends Node

var level_list = [
	"main_menu",
	"level1",
	"level2",
	"level3",
]

var level_dict = {
	"main_menu": "res://levels/main_menu.tscn",
	"level1": "res://levels/level1.tscn",
	"level2": "res://levels/level2.tscn",
	"level3": "res://levels/level3.tscn",
}


var cur_level_idx = 0
var cur_level = null
var cur_level_path = ""
var levels_completed = []

func _ready():
	reset_levels()

func load_level(level_path):
	if cur_level:
		cur_level.queue_free()
	cur_level = load(level_path).instance()
	cur_level_path = level_path

	# Find level path in level_list if it exists
	cur_level_idx = -1
	for i in range(level_list.size()):
		if level_list[i] == level_path:
			cur_level_idx = i
			break

	get_tree().get_root().add_child(cur_level)
	get_tree().current_scene = cur_level

func reload_level():
	load_level(cur_level_path)

func load_next_level():
	if cur_level_idx + 1 < level_list.size():
		cur_level_idx += 1
		load_level(level_dict[level_list[cur_level_idx]])
	else:
		reset_levels()

func level_completed():
	levels_completed.append(cur_level_path)
	load_next_level()

func reset_levels():
	levels_completed.clear()
	cur_level_idx = 0
	cur_level = null
	cur_level_path = ""
	load_level(level_dict["main_menu"])

func _on_level_completed():
	level_completed()