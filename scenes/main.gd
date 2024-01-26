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
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass