extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var dialog = get_node("AcceptDialog")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#display_accept_dialog();
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func display_accept_dialog():
	dialog.add_button("test")
	dialog.popup_centered()
	
func _draw():
	#Rect2 ( float x, float y, float width, float height )
	var rect = Rect2(100, 100, 100,100)
	draw_rect(rect, Color( 0.5, 1, 0, 1 ), true)
