/*
En ```buenaOfertaVegetariana()``` acá sí había que usar el mensaje abs() para retornar el valor absoluto de un número.
En el bonus falto quitar la comida de la coleccion de comidasPreparadas
 */
import comidas.*
import comensales.*

object cocina{
	const comidasPreparadas = []
	
	method agregarComidaPreparada(unaComida) {comidasPreparadas.add(unaComida)}
	method buenaOfertaVegetariana() = (self.cantidadComidasVegetarianas() - self.cantidadComidasNoVegetarianas()).abs() <= 2
	method cantidadComidasVegetarianas() = comidasPreparadas.count{c=>c.aptoVegetariano()}
	method cantidadComidasNoVegetarianas() = comidasPreparadas.count{c=>! c.aptoVegetariano()}
	method platoFuerteCarnivoro() = self.platosNoVegetarianos().max{p=>p.valoracion()}
	method platosNoVegetarianos() = comidasPreparadas.filter{c => ! c.aptoVegetariano()}
	method comidaQueLeGustan(unComensal) = comidasPreparadas.filter{c=>unComensal.leAgradaLaComida(c)}

	//Bonus
	method buscarUnPlato(unComensal) = if(self.comidaQueLeGustan(unComensal).isEmpty()){self.error("no se encuentran comidas que le gusten")}
								       else self.comidaQueLeGustan(unComensal).anyOne()
	method elegirUnPlato(unComensal) {unComensal.comer(self.buscarUnPlato(unComensal))}
}