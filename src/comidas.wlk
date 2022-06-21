class Plato {
	
	method peso()
	method valoracion()
	method aptoVegetariano()
	method esAbundante() = self.peso() > 250
}

class Provoleta inherits Plato{
	const property tieneEspecias
	var property peso
	
	override method aptoVegetariano() = ! tieneEspecias
	override method valoracion() = if(self.esEspecial()){120} else {80}
	method esEspecial() = tieneEspecias or self.esAbundante()
}

class HamburguesaCarne inherits Plato{
	const property pan
	const property peso = 250
	 
	override method aptoVegetariano() = false
	override method valoracion() = 60+ pan.puntos()	
}

object panIndustrial{
	var property puntos = 0
}

object panCasero{
	var property puntos = 20
}

object panMasaMadre{
	var property puntos = 45
}

class HamburgesasVegetarianas inherits HamburguesaCarne{
	const property legumbres
	
	override method aptoVegetariano() = true
	override method valoracion() = super() + (17.min(2*legumbres.size()))
}

class Parrillada inherits Plato{
	const cortesPedidos = []
	
	method pedirCorte(unCorte){ cortesPedidos.add(unCorte)}
	override method peso() = cortesPedidos.sum{c=>c.peso()}
	override method aptoVegetariano() = false
	override method valoracion() = 0.max(15*(self.corteMaximaCalidad().calidad())-cortesPedidos.size())
	method corteMaximaCalidad() = cortesPedidos.max{c=>c.calidad()}
}

class Corte{
	const property peso
	const property calidad
	const property nombre
}










