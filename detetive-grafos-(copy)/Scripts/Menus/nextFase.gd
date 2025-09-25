extends Node

@onready var proxima_fase: Button = $ProximaFase

var proximaFaseScena

func _on_proxima_fase_pressed() -> void:

	get_tree().change_scene_to_packed(proximaFaseScena)


func _on_resultados_resultado_signal(ganhou: bool) -> void:
		if ganhou:
			
			if Niveis.faseAtual.final:
				proximaFaseScena = Niveis.faseAtual.scena
				proxima_fase.text = "Gerara Novamente"
		
			else:
				proximaFaseScena = Niveis.fases[Niveis.faseAtual.numero + 1].scena
				proxima_fase.text = "Proxima fase"
		else:
			proximaFaseScena = Niveis.faseAtual.scena
			proxima_fase.text = "Tentar novamente"
			
		
