extends NinePatchRect
class_name CandleLightUi


@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func flame() -> void:
	self.animation_player.play("flame")
	
	
func flame_out() -> void:
	self.audio_stream_player.stop()
	self.animation_player.play("flame_out")
	
	
func flame_in() -> void:
	self.audio_stream_player.play()
	self.animation_player.play("flame_in")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Flame.modulate = Color.TRANSPARENT
	
	await self.get_tree().create_timer(0.5).timeout
	self.flame_in()
	await self.animation_player.animation_finished
	self.flame()
