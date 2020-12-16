extends Node2D

var started = false;
var atual = 0;
var fase = 0;
var parent = 0;


func _ready():
	parent = get_owner();
	pass # Replace with function body.


func _process(delta):
	if started:
		atual+=delta
	match fase:
		0:
			if atual>2:
				fase=1;
				atual=0;
				parent.setPositionRPGLabel(parent.getPlayer().position+Vector2(0,-40))
				parent.getRPGLabel().print_message("Uga buga sou um animal.", 24.0, ["res://sounds/fala_1.wav"])
		1:
			if atual>5:
				fase=2;
				atual=0;
				parent.setPositionRPGLabel(parent.getPlayer().position+Vector2(0,-40))
				parent.getRPGLabel().print_message("Não há nada que eu possa fazer, vou desistir e voltar a traz.", 24.0, ["res://sounds/fala_1.wav"])
		2:
			if atual>15:
				fase=3;
				atual=0;
				parent.setPositionRPGLabel(parent.getPlayer().position+Vector2(0,-40))
				parent.getRPGLabel().print_message("Talvez se eu aperatar espaço aconteça alguma coisa", 24.0, ["res://sounds/fala_1.wav"])



func _on_PPortaoEvent_body_entered(body):
	started=true
	pass # Replace with function body.
