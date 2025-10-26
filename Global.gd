extends Node
var falldist :=0.0
var waffleHP := 100.0
var playermodel := 0
var canMove = true
signal wrap()
func emitwrap():
	wrap.emit()
