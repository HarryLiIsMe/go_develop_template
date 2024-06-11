package tests

import (
	"testing"

	_ "github.com/joho/godotenv/autoload"
	"github.com/stretchr/testify/assert"
)

func TestCase3(t *testing.T) {
	assert.True(t, true, "test case3 failed!!!")
}

func TestCase4(t *testing.T) {
	assert.True(t, false, "test case4 failed!!!")
}
