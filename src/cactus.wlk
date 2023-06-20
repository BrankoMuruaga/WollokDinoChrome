import wollok.game.*
import colision.*
class Cactus {
	var property position = game.at(game.width() + 20, 10)
	var property image 
	const velocidad = 10
	
	method iniciar(){
		self.crearCactus()
		self.animar()
	}
	
	method animar(){
		game.onTick(10, "moverCactus",{
				if(self.position().x() > -50){
					self.mover()
				}
				else{
					self.eliminarCactus()
				}
				
			})
	}
	
	
	method crearCactus(){
		game.addVisual(self)
	}
	
	method mover(){
		position = position.left(velocidad)
	}
	
	method eliminarCactus(){
			game.removeVisual(self)	
			game.removeTickEvent("moverCactus")
			colisiones.colisiones().remove(colisiones.colisiones().first())			
	}
}

