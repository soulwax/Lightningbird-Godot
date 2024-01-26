@uid("uid://dlqgvfy4i80g0") # Generated automatically, do not modify.
extends Area2D

signal hit



func _on_body_entered(body:Node2D):
	hit.emit()