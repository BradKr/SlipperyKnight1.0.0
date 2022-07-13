extends CanvasLayer

var coins = 0
var tiempo= 180
func _ready():
	
	$coincollet.text = String(coins)	
	
func HandleCoincollected():
	 print("Coin Collected")
	 coins+=1
	 $coincollet.text = String(coins)	
	
	 if coins==5:
		 get_tree().change_scene("res://escenas/NivelFinal.tscn")

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(tiempo/60) + ":"+ String(tiempo%60)

func _on_Timer_timeout():
	if (tiempo >0):
		tiempo-=1
		update_time()
	else:
		get_tree().reload_current_scene()
