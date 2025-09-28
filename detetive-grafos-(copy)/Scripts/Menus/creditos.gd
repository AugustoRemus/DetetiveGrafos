extends Control


var linkGitHub: String = "https://github.com/AugustoRemus/DetetiveGrafos"

var linkItcio: String = "https://www.youtube.com/watch?v=xvFZjo5PgG0&list=RDxvFZjo5PgG0&start_radio=1"


func _on_botao_secreto_futurochave_pressed() -> void:
	print("segredo")
	

func _on_link_iticio_pressed() -> void:
	#OS.shell_open(linkItcio)
	pass


func _on_link_git_pressed() -> void:
	#OS.shell_open(linkGitHub)
	pass


func _on_voltar_2_pressed() -> void:
	pass
	#get_tree().change_scene_to_packed(preload("uid://dp04rhsw40lwt"))
