/*
Quizás en esta estaSatisfecho() de Comensal convenia delegar en un método auxiliar el cálculo del peso de lo que comió
Lo mismo que antes, para mas prolijidad convenia usar un metodo auxiliar en ```satisfecho()``` de DePaladarFino y Vegetarianos
Recorda que podes unar el mensaje x.even() a un número para saber si es par en lugar de usar la funcion modulo de 2  (x % 2) 
 */

import comidas.*

class Comensales {
	var property peso
	const comidasIngeridas = []
	
	method leAgradaLaComida(unaComida)
	method comer(unaComida) {comidasIngeridas.add(unaComida)}
	method estaSatisfecho() = comidasIngeridas.sum{c=>c.peso()} >= (peso/100)
}

class Vegetariano inherits Comensales{
	override method leAgradaLaComida(unaComida) = unaComida.aptoVegetariano() and unaComida.valoracion() > 85
	override method estaSatisfecho() = super() and comidasIngeridas.all{c=> ! c.esAbundante()}
}

class HambrePopular inherits Comensales{
	override method leAgradaLaComida(unaComida) = unaComida.esAbundante()
}

class PaladarFino inherits Comensales{
	override method leAgradaLaComida(unaComida) = unaComida.peso().between(150,300) and unaComida.valoracion() > 100
	override method estaSatisfecho() = super() and (comidasIngeridas.size())%2 == 0  
}

