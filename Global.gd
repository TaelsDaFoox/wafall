extends Node
var falldist :=0.0
var waffleHP := 1.0
var playermodel := 0
var canMove = true
signal wrap()
func emitwrap():
	wrap.emit()
