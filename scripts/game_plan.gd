extends Node2D

@onready var _node_borders: ColorRect = $Borders
@onready var _node_game: Node2D = $Game
const CORRECT_ASPECT_RATIO: float = 16.0/9.0
const BASE_WIDTH: float = 1920.0
const BASE_HEIGHT: float = 1080.0
func update_window_borders() -> void:
	var window_size: Vector2 = get_viewport_rect().size
	_node_borders.size = window_size
	var aspect_ratio: float = window_size.x / window_size.y
	var game_scale: float = 1.0
	if aspect_ratio == CORRECT_ASPECT_RATIO:
		_node_game.position = Vector2.ZERO
		game_scale = window_size.x / BASE_WIDTH
	elif aspect_ratio < CORRECT_ASPECT_RATIO:
		var temp: float = window_size.x/CORRECT_ASPECT_RATIO
		_node_game.position.x = 0.0
		_node_game.position.y = (window_size.y - temp) / 2.0
		game_scale = window_size.x / BASE_WIDTH
	else:
		var temp: float = window_size.y*CORRECT_ASPECT_RATIO
		_node_game.position.y = 0.0
		_node_game.position.x = (window_size.x - temp) / 2.0
		game_scale = window_size.y / BASE_HEIGHT
	_node_game.scale.x = game_scale
	_node_game.scale.y = game_scale

# Light Color = Color("#5EF871")
# Dark Color = Color("#4BC659")

func _process(_delta: float) -> void:
	update_window_borders()
