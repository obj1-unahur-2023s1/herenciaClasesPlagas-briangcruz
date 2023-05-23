import elementos.*

class Plaga{
	var property poblacion
	
	method transmitirEnfemedad() = poblacion  >= 10
	method atacar(unElemento){
		unElemento.recibirAtaque(self) //Self porque hace referencia a la instancia		
		poblacion *= 1.1
	}
	method coeficiente() = 1.1
}

class Cucaracha inherits Plaga{
	var property peso
	
	override method transmitirEnfemedad() = super() and peso >= 10 
	method nivelDeDanio() = poblacion/2
	override method atacar(unElemento){
		super(unElemento)
		peso += 2
	}
}

class Pulga inherits Plaga{
	method nivelDeDanio() =  poblacion * 2
}

class Garrapata inherits Pulga{
	override method coeficiente() = 1.2
}

class Mosquito inherits Plaga{
	override method transmitirEnfemedad() = super() and poblacion % 3 == 0  
	method nivelDeDanio() = poblacion
}