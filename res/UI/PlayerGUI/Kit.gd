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
	if value<10:
		asinCount.text = "0" + str(value)
	else:
		asinCount.text = str(value)

func change_bawang_text(value):
	if value<10:
		bawangCount.text = "0" + str(value)
	else:
		bawangCount.text = str(value)

func change_heal_text(value):
	if value<10:
		healCount.text = "0" + str(value)
	else:
		healCount.text = str(value)
