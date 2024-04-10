package main

import "C"

//export max_int
func max_int(a, b C.int) C.int {
	if a > b {
		return a
	} else {
		return b
	}
}

func main() {

}
