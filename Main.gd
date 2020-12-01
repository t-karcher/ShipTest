extends Node2D

const SHIP_COUNT = 10000

onready var planet_pos : Vector2 = $Planet.position

var ship_pos   : PoolVector2Array = []
var ship_rot   : PoolRealArray    = []
var ship_prox  : PoolRealArray    = []
var ship_speed : PoolRealArray    = []

var ship_canvas_item = []
var sprite = load("res://ship.png")

func _ready():
	for _i in range (SHIP_COUNT):
		ship_pos.append(planet_pos)
		ship_rot.append(2 * PI * randf())
		ship_prox.append(.2 + randf() * .8)
		ship_speed.append(130 + randf() * 40)
		
		var item = VisualServer.canvas_item_create()
		VisualServer.canvas_item_set_parent(item, get_canvas_item())
		VisualServer.canvas_item_add_texture_rect (item, Rect2(sprite.get_size() / 2, sprite.get_size()), sprite)

		ship_canvas_item.append(item)

func _process(delta):
	for i in range (SHIP_COUNT):
		ship_rot[i] = lerp_angle(ship_rot[i], (planet_pos - ship_pos[i]).angle(), ship_prox[i] * delta)
		ship_pos[i] += Vector2(1,0).rotated(ship_rot[i]) * ship_speed[i] * delta
		VisualServer.canvas_item_set_transform(ship_canvas_item[i], Transform2D(ship_rot[i], ship_pos[i]))
