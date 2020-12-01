extends Node2D

const SHIP_COUNT = 5000

onready var planet_pos : Vector2 = $Planet.position

var ship_pos   : PoolVector2Array = []
var ship_rot   : PoolRealArray    = []
var ship_prox  : PoolRealArray    = []
var ship_speed : PoolRealArray    = []

func _ready():
	for _i in range (SHIP_COUNT):
		ship_pos.append(planet_pos)
		ship_rot.append(2 * PI * randf())
		ship_prox.append(0.4 + randf() * 1.6)
		ship_speed.append(140 + randf() * 20)

func _process(delta):
	for i in range (SHIP_COUNT):
		ship_rot[i] = lerp_angle(ship_rot[i], (planet_pos - ship_pos[i]).angle(), ship_prox[i] * delta)
		ship_pos[i] += Vector2(1,0).rotated(ship_rot[i]) * ship_speed[i] * delta
	update()

func _draw():
	for i in range (SHIP_COUNT):
		draw_circle(ship_pos[i], 3, Color.white)
