extends CharacterBody2D

@onready var ray = $RayCast2D
@onready var player = get_tree().get_root().get_node("Main/Player")
var update_signaled = false
	
# Called when the node enters the scene tree for the first time.
func _ready():
	state.player.update_world.connect(update)

func _process(_delta):
	if update_signaled:
		print( ray.is_colliding() )
		
		#update_signaled = false
	#print(astar_grid.size)
	
func update():

	ray.force_raycast_update()
	print("BRUTE's TURN!!!")
	var player_position = state.player.get('position')
	var player_vector   = Vector2i(player_position.x, player_position.y)
#	@warning_ignore("narrowing_conversion")
#	var current_position = Vector2i(self.position.x, self.position.y)
#	var path_to_player = state.astar_grid.get_id_path( current_position / 16, player_vector / 16)
#	var next_move = path_to_player[1] * 16;
#	var move_difference = Vector2(next_move) - self.position
#	#print("Move difference " + str( move_difference ) )
#	#print(path_to_player.size())
#	#print("Next Move " + str(next_move / 16) )
	print("player " + str(player_vector / 16) )
	print("brute " + str(self.position / 16))

	#ray.target_position = move_difference * 2
	print( "Player Position: " + str(player_position / 16))
	ray.target_position = Vector2.LEFT * 16
	ray.force_raycast_update()
	print( "RAY TARGET " + str(ray.target_position) )
	#print("POTENTIAL MOVE " + str((self.position + Vector2(move_difference)) / 16))
	if( ! ray.is_colliding() ):
		print("BRUTE CAN MOVE")
	
		#self.position += Vector2(move_difference);
	else:
		print("BRUTE COLLIDING")
		print(Vector2i(ray.get_collision_point()) / 16)
	
