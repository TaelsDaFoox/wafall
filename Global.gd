extends Node
var falldist :=0.0
var waffleHP := 100.0
var playermodel := 0
var canMove = false
var musiccringe :=false
var songID := 0
var volslider:=0.0
var highscore := -9999
signal wrap()
func emitwrap():
	wrap.emit()
