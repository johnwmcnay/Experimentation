extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

export (int) var speed = 130

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	var ray = $RayCast2D2
	
	if Input.is_action_pressed('ui_right'):
		ray.set_cast_to(Vector2( 50, 0 ))
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		ray.set_cast_to(Vector2( -50, 0 ))
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		ray.set_cast_to(Vector2( 0, 50 ))
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		ray.set_cast_to(Vector2( 0, -50 ))
		velocity.y -= 1
	velocity = velocity.normalized() * speed


func get_animation():
	if Input.is_action_pressed('ui_right'):
		$AnimationPlayer.play("Walk Right")
	elif Input.is_action_pressed('ui_left'):
		$AnimationPlayer.play("Walk Left")
	elif Input.is_action_pressed('ui_down'):
		$AnimationPlayer.play("Walk")
	elif Input.is_action_pressed('ui_up'):
		$AnimationPlayer.play("Walk Up")
	else:
		$AnimationPlayer.stop()

func _physics_process(delta):
	get_input()
	get_animation()
	velocity = move_and_slide(velocity)
	if ($RayCast2D2.is_colliding()):
		print($RayCast2D2.get_collider().a)


func _on_Area2D_body_entered(body):
	print("test")
