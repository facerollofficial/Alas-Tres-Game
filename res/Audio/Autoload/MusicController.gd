extends Node

onready var enemiesDetected = 0

onready var level1BGM = $Level1BGM
onready var bossCombat = $BossCombat
onready var normalCombat = $NormalCombat
onready var darkAmbience = $DarkAmbience

onready var healSFX = $HealSFX

func _ready():
	pass

# NORMAL COMAT
func normal_fight_music_on():
	normalCombat.playing = true
	level1BGM.stream_paused = true

func normal_fight_music_off():
	normalCombat.playing = false
	level1BGM.stream_paused = false

# BOSS COMBAT
func play_boss_combat():
	bossCombat.playing = true

func pause_boss_combat():
	bossCombat.stream_paused = true

# SFX
func play_heal_sfx():
	healSFX.play()

# BGMS
func play_level1_bgm():
	level1BGM.playing = true

func play_dark_ambience():
	darkAmbience.playing = true
