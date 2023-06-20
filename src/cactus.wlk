import wollok.game.*
import colision.*
import dino.*

class Cactus {
	var property position = game.at(game.width() + 20, 10)
	var property image 
	const velocidad = 10
	const colisionContraDino = 
				new AreaDeColision(
				altoDeArea = 60, 
				anchoDeArea = 40,
				objPrincipal = self,
				objsQueColisionan = colisiones.objsQueColisionanContraItem(),
				accion = {game.stop()}
				)
	
	method iniciar(){
		self.crearCactus()
		self.animar()
		colisiones.objsQueColisionanContraDino().add(self)
		colisiones.colisionesContraItem().add(colisionContraDino)
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
			colisiones.objsQueColisionanContraDino().remove(self)			
			colisiones.colisionesContraItem().remove(colisionContraDino)			
	}
}

