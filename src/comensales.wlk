import comidas.*

class Comensales {
	var property peso
	const comidasIngeridas = []
	
	method leAgradaLaComida(unaComida)
	method comer(unaComida) {comidasIngeridas.add(unaComida)}
	method estaSatisfecho() = comidasIngeridas.sum{c=>c.peso()} >= (peso/100).abs()
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

