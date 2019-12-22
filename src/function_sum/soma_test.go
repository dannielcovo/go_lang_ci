package main

import "testing"

func TestSoma(t *testing.T){
    x := soma(5, 5)
    if x != 10 {
        t.Error("5 + 5 não é igual a 2, Tivemos:", x)
    }
}