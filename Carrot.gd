extends Area2D

var value : int = 0
var carrotValues = [5, 10, 20]

# Called when the node enters the scene tree for the first time.
func _ready():
    # Select a random color and value for each carot
    var carrot_types = $AnimatedSprite.frames.get_animation_names()
    var index = randi() % carrot_types.size()
    value = carrotValues[index]
    $AnimatedSprite.animation = carrot_types[index]
    $AnimatedSprite.playing = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_Carrot_body_entered(body):
    if body.name == "Player":
        body.eat_carrot(value)
        queue_free()
