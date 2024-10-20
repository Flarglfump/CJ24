extends TextureRect

@export var rows: int = 1
@export var cols: int = 4
@export var fps: int = 4

var time: float = 0.0
var size_atlas: Vector2 = Vector2(0, 0)

var cur_pos: Vector2 = Vector2(0, 0)
var cur_row: int = 0
var cur_col: int = 0

var atlas: AtlasTexture = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time = 1.0 / float(fps)
	
	$Timer.wait_time = time
	$Timer.timeout.connect(nextFrame)
	$Timer.start()

	if texture is AtlasTexture:
		atlas = texture
	else:
		printerr("Texture in", self.name, "is not an AtlasTexture")
		return

	size_atlas = atlas.get_size()

func nextFrame() -> void:
	if cur_col < cols:
		cur_pos.x += size_atlas.x
		atlas.region.position.x = cur_pos.x
		cur_col += 1
	
	if cur_col >= cols:
		cur_pos.x = 0
		atlas.region.position.x = 0
		cur_col = 0

		if cur_row < rows:
			cur_pos.y += size_atlas.y
			atlas.region.position.y = cur_pos.y
			cur_row += 1
		
		if cur_row >= rows:
			cur_pos.y = 0
			atlas.region.position.y = 0
			cur_row = 0
		
