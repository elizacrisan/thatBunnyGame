extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    # Select a random shape for the enemy
    var land_types = $AnimatedSprite.frames.get_animation_names()
    $AnimatedSprite.animation = land_types[randi() % land_types.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
