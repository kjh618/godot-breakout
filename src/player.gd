extends KinematicBody2D


export var speed := 400.0


func _physics_process(delta: float) -> void:
    var velocity := get_input()
    var _c := move_and_collide(velocity * delta)


func get_input() -> Vector2:
    var velocity := Vector2()
    if Input.is_action_pressed("move_left"):
        velocity.x -= 1
    if Input.is_action_pressed("move_right"):
        velocity.x += 1
    velocity = speed * velocity.normalized()
    return velocity
