extends Node


enum Colors {
	Player,
	Enemy,
	Neutral
}

enum DamageTypes {
	Contact,
}

var scenes: Dictionary[String, PackedScene] = {
	"TestProjectile": preload("res://Projectile.tscn")
}
