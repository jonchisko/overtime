extends Control
class_name Candle

@onready var candle_v_box: VBoxContainer = $CandleVBox

var original_pos_y: float = -1
var original_size_y: float = -1

var max = 330
var min = 16

func set_candle_length(amount_percent: int) -> void:
	self._store_original()
	
	var delta_life: float = (100.0 - amount_percent)/100.0
	var delta_size = max - min
	var amount = ceil(delta_life * delta_size)

	self.candle_v_box.position.y = self.original_pos_y + amount
	self.candle_v_box.size.y = self.original_size_y - amount
	
	if amount_percent == 0:
		await self.get_tree().create_timer(0.3).timeout
		($CandleVBox/TopStem as CandleLightUi).flame_out()


func _store_original() -> void:
	if self.original_pos_y == -1 or self.original_size_y == -1:
		self.original_pos_y = self.candle_v_box.position.y
		self.original_size_y = self.candle_v_box.size.y
