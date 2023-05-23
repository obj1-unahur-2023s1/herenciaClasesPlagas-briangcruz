import plagas.*

class Hogar{
	var property nivelMugre
	var property confort = 0
	
	method esBueno() = nivelMugre <= confort/2    
	method recibirAtaque(unaPlaga){
		nivelMugre += unaPlaga.nivelDeDanio()
	}
}

object produccion{
	var property nivel = 0 
}

class Huerta{
	var property capacidadProduccion
	var property nivelDeProduccion = produccion
	
	method reducirProduccionPorEnfermedadDePlaga_(unaPlaga){
		if (unaPlaga.transmitirEnfemedad()){
			capacidadProduccion = 0.max( capacidadProduccion - 10)
		}
	}
	method esBueno() = capacidadProduccion > nivelDeProduccion.nivel()
	
	method recibirAtaque(unaPlaga){
		capacidadProduccion = 0.max(capacidadProduccion - unaPlaga.nivelDeDanio() * 0.1) 
		self.reducirProduccionPorEnfermedadDePlaga_(unaPlaga)
	}
}

object limiteDeSalud{
	var property limiteSalud = 0
}

class Mascota{
	var property nivelSalud
	
	method esBueno() = nivelSalud > limiteDeSalud.limiteSalud(250)
	method recibirAtaque(unaPlaga){
		if(unaPlaga.transmitirEnfemedad()){
			nivelSalud = 0.max( nivelSalud -= unaPlaga.nivelDeDanio())
		}
	}
}

class Barrio{
	const property elementos = []
	
	method agregarElemento(elemento){
		elementos.add(elemento)
	}
	
	method cantElementosBuenos(){
		return elementos.count({e => e.esBueno()})
	}
	method cantElementosNoBuenos(){
		return elementos.count({e => not e.esBueno()})
	}
	
	method esCopado(){
		return self.cantElementosBuenos() > self.cantElementosNoBuenos()
	}
	
	method esCopadoSinAux(){
		return self.cantElementosBuenos() > elementos.size() - self.cantElementosBuenos()
	}

}

