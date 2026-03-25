extends CharacterBody2D
var speed = 600
var last_direction = ""
@onready var player = $Sprite2D
func _physics_process(delta: float) -> void:
	var directions = Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo")
	velocity = directions * speed
	if directions.x < 0:
		player.flip_h = true
	else:
		player.flip_h = false
	move_and_slide()
