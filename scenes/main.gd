@uid("uid://d3012p6bkk1kk") # Generated automatically, do not modify.
extends Node2D

@export var pipe_scene : PackedScene

var game_running : bool
var game_over : bool
var scroll
var score
var SCROLL_SPEED : int = 200
var screen_size : Vector2i # placeholder
var ground_height : int	# placeholder
var pipes : Array # stores all pipes
const PIPE_DELAY : int = 100
const PIPE_RANGE : int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_window().size
	new_game()

func new_game():
	# reset variables
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	pipes.clear()
	# generate starting pipes
	generate_pipes()
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
						check_top()


func start_game():
	game_running = true
	$Bird.flying = true
	$Bird.flap()
	#start pipe counter
	$PipeTimer.start()

func stop_game():
	$PipeTimer.stop()
	$Bird.flying = false
	game_running = false
	game_over = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_running:
		scroll += SCROLL_SPEED * delta
		if scroll > screen_size.x:
			scroll = 0
		# move ground node
		$Ground.position.x = -scroll
		# move pipes
		for pipe in pipes:
			pipe.position.x -= SCROLL_SPEED * delta
	
func generate_pipes():
	var pipe = pipe_scene.instantiate()
	pipe.position.x = screen_size.x + PIPE_DELAY
	pipe.position.y = (screen_size.y - ground_height) / 2.0 + randi_range(-PIPE_RANGE, PIPE_RANGE)
	pipe.hit.connect(bird_hit)
	add_child(pipe)
	pipes.append(pipe)

func check_top():
	if $Bird.position.y < 0:
		$Bird.falling = true
		stop_game()

func _on_pipe_timer_timeout():
	generate_pipes()

func bird_hit():
	$Bird.falling = true
	stop_game()
