@uid("uid://cqa44kpr5yjgw") # Generated automatically, do not modify.
extends CharacterBody2D

const GRAVITY : int = 1000
const MAX_VELOCITY : int = 600
const FLAP_SPEED : int = -500

var flying : bool = false
var falling : bool = false
const START_POS = Vector2(100, 400)

func _ready():
	reset()
	
func reset():
	falling = false
	flying = false
	position = START_POS
	set_rotation(0)
	
func _physics_process(delta):
	if flying or falling:
		velocity.y += GRAVITY * delta
		#terminal velocity
		if velocity.y > MAX_VELOCITY:
			velocity.y = MAX_VELOCITY
		if flying:
			set_rotation(deg_to_rad(velocity.y * 0.05))
			$AnimatedSprite2D.play()
		elif falling:
			set_rotation(PI/2)
			$AnimatedSprite2D.stop()
		move_and_collide(velocity * delta)
	else:
		$AnimatedSprite2D.stop()
		
func flap():
	velocity.y = FLAP_SPEED
