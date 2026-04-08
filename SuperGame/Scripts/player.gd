extends CharacterBody2D
var speed = 600
var last_direction = ""
@onready var player = $AnimatedSprite2D
func _physics_process(delta: float) -> void:
	var directions = Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo")
	velocity = directions * speed
	
	if directions == Vector2.ZERO:
		directions = Vector2.ZERO
		player.play("idle")
	else:
		if directions.x > 0:
			player.play("Derecha")
		elif directions.x < 0:
			player.play("Izquierda")
		elif directions.y < 0:
			player.play("Arriba")
		else: player.play("Abajo")
	move_and_slide()
