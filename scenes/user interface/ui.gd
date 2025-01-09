extends CanvasLayer

func update_laser_text():
	$LaserCounter/VBoxContainer/Label.text = str(Globals.laser_amount)

func update_grenade_text():
	$GrenadeCounter/VBoxContainer/Label.text = str(Globals.grenade_amount)
