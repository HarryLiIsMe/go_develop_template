package main

import (
	"fmt"
	"os"

	_ "github.com/joho/godotenv/autoload"
)

func main() {
	projectName := os.Getenv("PROJECT_NAME")

	fmt.Println("hello world", projectName)
}
