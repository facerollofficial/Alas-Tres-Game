extends Control

onready var enemyTikbalang = $EnemyTikbalangInfo
onready var enemyTiyanak = $EnemyTiyanakInfo
onready var enemyMangkukulam = $EnemyMangkukulam
onready var enemyManananggal = $EnemyManananggalInfo
onready var enemyBungisngis = $EnemyBungisngis
onready var allyAghoy = $AllyAghoy

func _ready():
	self.visible = false
	enemyTikbalang.visible = false
	enemyMangkukulam.visible = false
	enemyTiyanak.visible = false
	enemyBungisngis.visible = false
	enemyManananggal.visible = false
	allyAghoy.visible = false


func _unhandled_input(event):
	if event.is_action_pressed("CloseInfo"):
		enemyTikbalang.visible = !enemyTikbalang.visible
		enemyMangkukulam.visible = !enemyMangkukulam.visible
		enemyTiyanak.visible = !enemyTiyanak.visible
		enemyBungisngis.visible = !enemyBungisngis.visible
		enemyManananggal.visible = !enemyManananggal.visible
		allyAghoy.visible = !allyAghoy.visible
	

func _on_AghoyButton_pressed():
	print("Aghoy displayed.")
	allyAghoy.visible = true

func _on_MangkukulamButton_pressed():
	print("Mangkukulam displayed.")
	enemyMangkukulam.visible = true

func _on_TiyanakButton_pressed():
	print("Tiyanak displayed.")
	enemyTiyanak.visible = true

func _on_TikbalangButton_pressed():
	print("Tikbalang displayed.")
	enemyTikbalang.visible = true


func _on_ManananggalButton_pressed():
	print("Manananggal displayed.")
	enemyManananggal.visible = true


func _on_BungisngisButton_pressed():
	print("Bungisngis displayed.")
	enemyBungisngis.visible = true
