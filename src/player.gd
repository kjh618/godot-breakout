extends KinematicBody2D


export var speed := 400.0


func _physics_process(delta: float) -> void:
    var velocity := get_input_vector() * speed
    var _c := move_and_collide(velocity * delta)


func get_input_vector() -> Vector2:
    var input := Vector2()
    if Input.is_action_pressed("move_left"):
        input.x -= 1
    if Input.is_action_pressed("move_right"):
        input.x += 1
    return input.normalized()
