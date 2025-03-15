extends Node2D
class_name FloatingText

@export var distance: float
@export var duration: float
@export var scale_amount: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = self.create_tween()
	
	tween.tween_property(self, "global_position", self.global_position + Vector2.UP * self.distance, self.duration)\
	.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	tween.set_parallel()
	tween.tween_property($Label, "scale", $Label.scale + Vector2.ONE * self.scale_amount, self.duration)\
	.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "modulate", Color.TRANSPARENT, self.duration)\
	.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	tween.play()
	

func set_amount(amount: int) -> void:
	$Label.text = str(amount)
