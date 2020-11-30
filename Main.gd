extends Node2D

var ShipScene = preload("res://Ship.tscn")
onready var planet_pos = $Planet.position
var ships = []

func _ready():
	for i in range (3000):
		ships.append(ShipScene.instance())
		add_child(ships[-1])

func _process(delta):
	for ship in ships:
		ship.rotation = lerp_angle(ship.rotation, (planet_pos - ship.position).angle(), ship.prox * delta)
		ship.position += Vector2(1,0).rotated(ship.rotation) * ship.speed * delta
