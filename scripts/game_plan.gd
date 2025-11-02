extends Node2D

func update_window_borders() -> void:
	var window_size: Vector2 = get_viewport_rect().size
	var aspect_ratio: float = window_size.x / window_size.y
