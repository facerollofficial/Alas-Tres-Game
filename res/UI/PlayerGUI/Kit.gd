extends Control

onready var asinCount = $Asin/AsinCount
onready var bawangCount = $Bawang/BawangCount
onready var healCount = $Heal/HealCount

# Called when the node enters the scene tree for the first time.
func _ready():
	asinCount.text = str(PlayerStats.asinAmmo)
	bawangCount.text = str(PlayerStats.bawangAmmo)
	healCount.text = str(PlayerStats.oreganoHeal)
	PlayerStats.connect("no_health", self, "game_over")
	PlayerStats.connect("asin_ammo_changed", self, "change_asin_text")
	PlayerStats.connect("bawang_ammo_changed",self,"change_bawang_text")
	PlayerStats.connect("oregano_changed",self,"change_heal_text")

func game_over():
	self.visible = false

func change_asin_text(value):
	asinCount.text = str(value)

func change_bawang_text(value):
	bawangCount.text = str(value)

func change_heal_text(value):
	healCount.text = str(value)
