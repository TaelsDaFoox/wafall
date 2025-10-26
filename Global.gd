extends Node
var falldist :=0.0
var waffleHP := 100.0
var playermodel := 0
var canMove = false
var musiccringe :=false
signal wrap()
func emitwrap():
	wrap.emit()
