@tool
extends Node2D

@export var dark: bool:
	set(x):
		dark = x	
		update_material()

var api_hovered: bool = false
signal api_pressed
var api_pressed_bool: bool = false

func _button_pressed() -> void:
	api_pressed.emit()
	
@onready var _btn: Button = $Button
func _process(_delta: float) -> void:
	api_hovered = _btn.is_hovered()
	api_pressed_bool = _btn.button_pressed
	var b: float = 0.75 if dark else 1.0
	if api_hovered:
		b += 0.05
	if api_pressed_bool:
		b += 0.05
	$MeshInstance2D.material.set_shader_parameter("bright",b)

func update_material() -> void:
	$MeshInstance2D.material.set_shader_parameter("bright", 0.75 if dark else 1.0)

func _ready() -> void:
	$MeshInstance2D.material = $MeshInstance2D.material.duplicate()
	update_material()
