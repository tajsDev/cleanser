extends Node3D

var navigation_mesh: NavigationMesh
var region_rid: RID

func _ready() -> void:
	navigation_mesh = NavigationMesh.new()
	region_rid = NavigationServer3D.region_create()

	# Enable the region and set it to the default navigation map.
	NavigationServer3D.region_set_enabled(region_rid, true)
	NavigationServer3D.region_set_map(region_rid, get_world_3d().get_navigation_map())

	# Add vertices for a convex polygon.
	navigation_mesh.vertices = PackedVector3Array([
		Vector3(-1.0, 0.0, 1.0),
		Vector3(1.0, 0.0, 1.0),
		Vector3(1.0, 0.0, -1.0),
		Vector3(-1.0, 0.0, -1.0),
	])

	# Add indices for the polygon.
	navigation_mesh.add_polygon(
		PackedInt32Array([0, 1, 2, 3])
	)

	NavigationServer3D.region_set_navigation_mesh(region_rid, navigation_mesh)
