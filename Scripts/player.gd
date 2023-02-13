extends KinematicBody2D
#
# Main player script
#

const FRICTION: int = 200
const MAX_SPEED: int = 60
export(int) var acceleration = 40
var mov_direction: Vector2 = Vector2.ZERO
var _velocity: Vector2
var _target_block: StaticBody2D = null
onready var _sprite = $Sprite

func _input(_event):
	if Input.is_action_pressed("ui_select"):
		if _target_block != null:
			_target_block.be_mined()
		
func _physics_process(delta):
	_move(delta)
	move_and_collide(_velocity * delta)


func _move(delta):
	mov_direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_down"):
		mov_direction = Vector2.DOWN
		rotation_degrees = 180
	if Input.is_action_pressed("ui_up"):
		mov_direction = Vector2.UP
		rotation_degrees = 0
	if Input.is_action_pressed("ui_right"):
		mov_direction = Vector2.RIGHT
		rotation_degrees = 90
	if Input.is_action_pressed("ui_left"):
		mov_direction = Vector2.LEFT
		rotation_degrees = 270
	mov_direction = mov_direction.normalized()
	
	
	if mov_direction != Vector2.ZERO:
		_velocity += mov_direction * acceleration
		_velocity = _velocity.limit_length(MAX_SPEED)
	else:
		_velocity = _velocity.move_toward(Vector2.ZERO, FRICTION * delta)


func _release_other_inputs(pressed_input):
	var control_inputs = ["ui_down", "ui_up", "ui_left", "ui_right"]
	for i in control_inputs:
		if i != pressed_input:
			Input.action_release(i)








func _on_PlayerDrill_body_entered(body):
	if body.is_in_group("MinableBlock"):
		body.is_minable = true
		_target_block = body
		print(body.is_minable)
		


func _on_PlayerDrill_body_exited(body):
	if body.is_in_group("MinableBlock"):
		body.is_minable = false
		_target_block = null
		print(body.is_minable)

