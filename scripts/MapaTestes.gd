extends Node2D


func _ready():
	$RPGLabel.print_message("Ola mundo, estou aqui apenas para testar essa box!", 24.0, ["res://sounds/fala_1.wav"])
	pass # Replace with function body.

func _process(delta):
	
	
	
	
	pass

func setPositionRPGLabel(pos):
	$RPGLabel.rect_position =pos;
	pass


func getRPGLabel():
	return $RPGLabel
	
func getPlayer():
	return $Player
