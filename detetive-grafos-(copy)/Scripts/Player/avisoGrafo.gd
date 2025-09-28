extends AnimatedSprite2D

@onready var timer: Timer = $Timer



func aparecer():
	visible = true
	timer.start(2)


func _on_timer_timeout() -> void:
	visible = false
