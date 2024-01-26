@uid("uid://d3012p6bkk1kk") # Generated automatically, do not modify.
extends Node2D

var game_running : bool
var game_over : bool
var scroll
var score
const SCROLL_SPEED : int = 4
var screen_size : Vector2i # placeholder
var ground_height : int	# placeholder
var pipes : Array # stores all pipes
const PIPE_DELAY : int = 100
const PIPE_RANGE : int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	# reset variables
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	$Bird.reset()

func _input(event):
	if game_over == false:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if game_running == false:
					start_game()
				else:
					if $Bird.flying:
						$Bird.flap()


func start_game():
	game_running = true
	$Bird.flying = true
	$Bird.flap()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	log(delta)
	pass