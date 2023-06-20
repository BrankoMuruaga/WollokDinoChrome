import wollok.game.*

object puntaje {
	var property position = game.at(0,0)
	const puntaje = []
	const espaciadoEntreNumeros = 23
	
	method agregarPuntaje(unNumero){
		
		self.removerPuntaje()
		puntaje.clear()		
		var posicionAnterior = position
		const numeros = unNumero.toString().split("")
		
		numeros.forEach{n => 
			puntaje.add(new Numero(stringDenumero = n, position = posicionAnterior))
			posicionAnterior = game.at(posicionAnterior.x() + espaciadoEntreNumeros, posicionAnterior.y())
		}
		
		puntaje.forEach{n => game.addVisual(n)}
	}
	
	method removerPuntaje(){
		if(!puntaje.isEmpty()){
			
			puntaje.forEach{n =>
				game.removeVisual(n)
			} 	
			
		}
		
	}
	
	
}

class Numero{
	var stringDenumero
	var property image = self.imagenDe(stringDenumero)
	var property position 

	method imagenDe(unNumero) = unNumero + ".png"
}





/* 
object puntaje {
	var property position = game.at( game.width() - 250 ,game.height() - 150)
	var property image = "punto.png"
	var puntaje = 0
	
	method iniciar(){
		game.addVisual(self)
		self.sumar()
	}
	
	method sumar(){
		game.onTick(500, "puntaje",{
			puntaje++
			game.say(self, puntaje.toString())
		}) 
	}
}

*/