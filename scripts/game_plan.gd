extends Node2D

@onready var _node_borders: ColorRect = $Borders
@onready var _node_game: Node2D = $Game
func update_window_borders() -> void:
	var window_size: Vector2 = get_viewport_rect().size
	_node_borders.size = window_size
	var aspect_ratio: float = window_size.x / window_size.y
	if aspect_ratio == 16/9:
		_node_game.position = Vector2(0.0,0.0)
		var game_scale: float = window_size.x / 1080.0
		_node_game.scale.x = game_scale
		_node_game.scale.y = game_scale

func _process(_delta: float) -> void:
	update_window_borders()
