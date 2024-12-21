extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -300.0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	var collision = move_and_collide(velocity*delta)
	if collision:
		if collision.get_collider().name == "Ennemy":
			get_parent().get_node("GameOver").visible = true
			print("GAME OVER")
