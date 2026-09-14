extends CanvasLayer

var time = 0
var score = 0
@onready var time_label = $TIME
@onready var score_label = $SCORE

func _process(delta: float) -> void:
	updateTime()
	updateScore()

func updateTime() :
	time = Time.get_ticks_msec()/1000
	time_label.text = "Time: " + str(time)

func updateScore() : 
	score_label.text = "Score: " + str(score)
