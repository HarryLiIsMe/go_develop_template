package tests

import (
	"testing"

	_ "github.com/joho/godotenv/autoload"
	"github.com/stretchr/testify/assert"
)

func TestCase1(t *testing.T) {
	assert.True(t, true, "test case1 failed!!!")
}

func TestCase2(t *testing.T) {
	assert.True(t, false, "test case2 failed!!!")
}
