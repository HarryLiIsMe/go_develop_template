package main

import "C"

//export equal_int
func equal_int(a, b C.int) C.int {
	if a == b {
		return 1
	} else {
		return 0
	}
}
