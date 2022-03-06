extends KinematicBody2D


# Declare member variables here. Examples:
var score : int = 0
var speed : int = 300
var jumpForce : int = 400
var gravityPull : int = 400
var velocity : Vector2 = Vector2(0,0)
onready var sprite : AnimatedSprite = $AnimatedSprite
onready var scoreLabel = get_node("/root/MainScene/HUD")


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _physics_process(delta):
    # Set default velocity to 0 if no button is pushed
    velocity.x = 0
    # Check the input from buttons
    if Input.is_action_pressed("move_right"):
        velocity.x += speed
    if Input.is_action_pressed("move_left"):
        velocity.x -= speed
    
    # Gravitation in action
    velocity.y += gravityPull * delta
    # Jump input
    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y -= jumpForce
        
    # Movement based on velocity
    velocity = move_and_slide(velocity, Vector2.UP)
    
    # Sprite flipping based on the walking direction
    if velocity.x < 0:
        sprite.flip_h = true
    elif velocity.x > 0:
        sprite.flip_h = false
    # Sprite appearance
    if velocity.x != 0 and is_on_floor():
        sprite.animation = "run"
    elif velocity.x == 0 and is_on_floor():
        sprite.animation = "idle"
    elif velocity.y < 0 and !is_on_floor():
        sprite.animation = "jump"
    else:
        sprite.animation = "fall"
    sprite.play()


func eat_carrot(value : int):
    score += value
    scoreLabel.update_score(score)
