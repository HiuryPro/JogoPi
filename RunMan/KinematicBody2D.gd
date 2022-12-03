extends KinematicBody2D

export (int) var speed = 200
onready var _animated_sprite = $AnimatedSprite
var velocidade = 100
var movimento = Vector2()
var lastlado = 0
var gravity = 700
var jumpcount = 0
var jumps = -250


func animate(motion):
	if motion.x != 0 and is_on_floor():
		_animated_sprite.play("walkfrente")
		if motion.x > 0:
			_animated_sprite.flip_h = false
		else:
			_animated_sprite.flip_h = true
	elif  motion.y != 0 and not is_on_floor():
		_animated_sprite.play("jump")
	else:
		_animated_sprite.play("idle")
	

func jump():
	if Input.is_action_just_pressed("jump") and jumpcount < 1:
		
		movimento.y = jumps
		jumpcount += 1

		
	if is_on_floor():
		print('chão')
		jumpcount = 0
	

func get_input():
	movimento.x = 0
	if Input.is_action_pressed("ui_right"):
		movimento.x += velocidade
	elif Input.is_action_pressed("ui_left"):
		movimento.x -= velocidade

	

func _physics_process(delta):
	
		   
	get_input()
	movimento.y += gravity * delta
	movimento = move_and_slide(movimento, Vector2.UP)
	jump()
	animate(movimento)

# Replace with function body.
	


