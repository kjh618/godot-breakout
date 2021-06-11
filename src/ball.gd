extends KinematicBody2D


export var speed := 500.0

var velocity := Vector2.DOWN * speed


func _physics_process(delta: float) -> void:
    var collision := move_and_collide(velocity * delta)

    if collision != null:
        $BounceSound.play()
        velocity = velocity.bounce(collision.normal)
        velocity = (velocity + collision.collider_velocity).normalized() * speed

        if collision.collider.is_in_group("brick"):
            $BrickBreakSound.play()
            collision.collider.queue_free()
