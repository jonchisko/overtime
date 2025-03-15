extends CanvasLayer
class_name LifeHud

@onready var candle: Candle = $PanelContainer/HBoxContainer/CandleContainer/Candle

func set_life(amount: int) -> void:
	candle.set_candle_length(amount)
