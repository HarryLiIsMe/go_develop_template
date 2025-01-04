package main

import (
	"fmt"
	"os"

	_ "github.com/joho/godotenv/autoload"
)

func main() {
	projectName, ok := os.LookupEnv("PROJECT_NAME")
    if ok {
	    fmt.Println("hello world", projectName)
    } else {
        panic("env load failed!!!")
    }
}
