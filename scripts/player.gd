extends KinematicBody2D

#creamos nuestras  variables 
const moveSpeed = 300
const maxSpeed = 400

const jumpHeight = -600
const up = Vector2(0,-1)
const gravity = 20
#referencias de nuestros componentes
onready var sprite =$Sprite
onready var animationPlayer = $AnimationPlayer

var motion = Vector2()
#esto comprobara si es que estamos presionando una tecla u otra
func _physics_process(delta):
	#esto dara una gravedad al jugador para que no se vaya volando
	motion.y += gravity
	#creamos una friction 
	var friction = false
	#cada vez que presionemos la flecha derecha el sprite no aplicara la funcion flip_h
	#se reproducira la animacion "walk"
	#Los valores positivos van hacia la derecha, osea motion en el eje X ira hacia la derecha
	if Input.is_action_pressed("ui_right"):
		 sprite.flip_h = false
		 animationPlayer.play("Walk")
		 motion.x = min(motion.x + moveSpeed,+maxSpeed)
	#cada vez que presionemos la flecha izquieda el sprite aplicara la funcion flip_h
	#se reproducira la animacion "walk"
	#Los valores negativos van hacia la izquierda, osea motion en el eje X ira hacia la izquierda
	elif Input.is_action_pressed("ui_left"):
		 sprite.flip_h = true
		 animationPlayer.play("Walk")
		 motion.x = max(motion.x - moveSpeed,-maxSpeed)
	#en cambio si no presionamos nada el sprite hara la animacion de "Idle"
	# y se aplica friction
	else:
		animationPlayer.play("Idle")
		friction = true
	#cuando este en el piso
	#cada que vez presionemos la tecla espacio motion el el eje Y sera igual a JumpHeight
	#comprobamos nuestra friction
	#en el motion X se aplica un suavizado de movimiento con lerp
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = jumpHeight	
			animationPlayer.play("Jump")
		if friction == true:
			motion.x = lerp(motion.x ,0,0.5)
	
	else:
		if friction ==true:
		   motion.x = lerp(motion.x ,0,0.01)
	
	motion = move_and_slide(motion,up)
	
	
	#creamos una funcion para la moneda
func add_Coin():
	 #esto se encargara de buscar en nuestra jerarquia nuestro canvasLayer 
	var CanvasLayer = get_tree().get_root().find_node("CanvasLayer",true,false);
	#en nuestra jerarquia buscara el grupo sfx y se reproducira el nodo 1
	get_tree().get_nodes_in_group("sfx")[0].get_node("1").play()
	
	CanvasLayer.HandleCoincollected()
