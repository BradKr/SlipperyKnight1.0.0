extends Node2D

#al exportar las variables es para que se puedan modificar los valores en el mismo inspector
 
export var dur_inactive: float = 1.2
export var mover_a: Vector2
export var tama_cell: Vector2
export var velocidad: float = 3.0
#esta variable lo que hace es guardar la posicion de destino de nuestra plataforma
var seguir:Vector2 = Vector2.ZERO
onready var Plataforma = $KinematicBody2D
onready var tween = $MoveTween
#llamamos a la funcion _ready con void, el void hara que no devuelva ningun valor de retorno
func _ready() -> void:
	_ini_tween()

func _ini_tween() -> void:
	#mover a es igualado a su mismo valor por el tamallo de la celda
	mover_a = mover_a * tama_cell
	#la variable durac es igual a mover_a.length dividido a la velocidad es decir el tiempo es igual
	# a la distancia dividido  a la velocidad 
	var durac = mover_a.length() / velocidad
	#nuestro tween se interpolara asi mismo a seguir en nuestra posicion incial y nuestra posicion final seria
	#mover_a luego el durac para saber cuanto tiempo de duracion, el tween.trans_linear es el tipo de animacion
	#en este caso una animacion lineal y el dur_inactive es el tiempo que esta inactivo la plataforma
	tween.interpolate_property(self, "seguir", Vector2.ZERO, mover_a, durac, tween.TRANS_LINEAR, tween.EASE_IN_OUT, dur_inactive)
	tween.interpolate_property(self, "seguir", mover_a, Vector2.ZERO , durac, tween.TRANS_LINEAR, tween.EASE_IN_OUT, durac + dur_inactive * 2)
	tween.start()
	
func _physics_process(delta):
	#la posicion de la plataforma es igual a seguir
	Plataforma.position = seguir
