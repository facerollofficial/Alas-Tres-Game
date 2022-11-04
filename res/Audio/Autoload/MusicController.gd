extends Node
var normalCombatMusicIsPlaying = false
var bossCombatMusicIsPlaying = false

func _ready():
	pass

# NORMAL COMAT
func play_normal_combat():
	$NormalCombat.playing = true

func pause_normal_combat():
	$BossCombat.stream_paused = true

# BOSS COMBAT
func play_boss_combat():
	$BossCombat.playing = true

func pause_boss_combat():
	$BossCombat.stream_paused = true

# SFX
func play_heal_sfx():
	$HealSFX.play()

# BGMS
func play_level1_bgm():
	$Level1BGM.playing = true

func play_dark_ambience():
	$DarkAmbience.playing = true
