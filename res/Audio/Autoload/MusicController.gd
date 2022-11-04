extends Node
var normalCombatMusicIsPlaying = false
var bossCombatMusicIsPlaying = false

func _ready():
	$HealSFX.play()

func play_normal_combat():
	$NormalCombat.play()

func play_boss_combat():
	$BossCombat.play()

func pause_normal_combat():
	$BossCombat.play()

func play_heal_sfx():
	$HealSFX.play()

func play_level1_bgm():
	$Level1BGM.play()

func play_dark_ambience():
	$DarkAmbience.play()
