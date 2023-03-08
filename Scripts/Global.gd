extends Node

@onready var player = get_tree().get_root().get_node('Main/Player')
@onready var world = get_tree().get_root().get_node('Main/World')
var astar_grid = AStarGrid2D.new()
var world_tiles
var world_rect

# Called when the node enters the scene tree for the first time.
func _ready():
	world_tiles = world.get_used_cells(0)
	world_rect = world.get_used_rect()
	astar_grid.size = Vector2i(world_rect.size)
	astar_grid.cell_size = Vector2(1,1)
	astar_grid.offset = world_rect.position
	astar_grid.diagonal_mode = 1
	astar_grid.update()
