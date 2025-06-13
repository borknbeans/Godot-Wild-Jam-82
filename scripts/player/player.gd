class_name Player
extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export_category("Movement")
@export var max_horizontal_speed: float = 160.0
@export var acceleration: float = 18.0
@export var gravity: float = -10.0
@export var max_fall_speed: float = 300.0
@export var jump_strength: float = 500.0
