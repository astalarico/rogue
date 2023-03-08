extends Node

signal update_world
const GRID_CELL_SIZE = 16
@onready var ray = $RayCast2D
var move_tween

var directions = {
	'ui_up' : Vector2.UP,
	'ui_down' : Vector2.DOWN,
	'ui_right' : Vector2.RIGHT,
	'ui_left' : Vector2.LEFT
}
	
func _unhandled_input(event)->void:
	for direction in directions:
		if event.is_action_pressed(direction):
			move(direction)
			
			
func move( direction )->void:
	var vector_position = directions[direction] * GRID_CELL_SIZE
	#print("vector position" + str(self.position))
	ray.target_position = vector_position
	#print("PLAYER VECTOR POSITION FOR RAY CAST " + str(vector_position ))
	ray.force_raycast_update()
	emit_signal("update_world")
	if !ray.is_colliding():
		self.position += vector_position
		print("PLAYER POSITION " + str(self.position / 16))

		#print(self.position)
	
#		if ! move_tween or ! move_tween.is_running():
#			move_tween = create_tween()
#			#print( move_tween )
#			move_tween.set_trans(Tween.TRANS_SINE)
#			move_tween.tween_property(
#				self,
#				"position",
#				Vector2(self.position) + Vector2(vector_position),
#				.15
#			)
#
#			emit_signal("update_world")
		#move_tween.set_interval(.15)
	
	else:
		var nodeObj = ray.get_collider();
		if( nodeObj.has_method('_interact')):
			nodeObj.call('_interact', direction)
			
		#print( ray.get_collision_point() )
		print( nodeObj.get('position') )
		

func _onready()->void:
	emit_signal("update_world")
