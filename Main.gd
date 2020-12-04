extends Node2D

const SHIP_COUNT = 250000

onready var planet_pos : Vector2 = $Planet.position
onready var ships : Particles2D = $Ships

func _ready():
	ships.amount = SHIP_COUNT
	ships.process_material.set_shader_param("target", planet_pos)
	ships.emitting = true
