extends KinematicBody2D


export var speed := 300.0

var _velocity := speed * Vector2.DOWN


func _physics_process(delta: float) -> void:
    var collision := move_and_collide(_velocity * delta)
    if collision != null:
        _velocity = _velocity.bounce(collision.normal)
        if collision.collider.is_in_group("brick"):
            collision.collider.queue_free()
