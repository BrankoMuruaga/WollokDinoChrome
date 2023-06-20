import wollok.game.*
import colision.*
import dino.*

class Obstaculo{
	const alturaDeSpawn
	var property position = game.at(game.width() + 20, alturaDeSpawn)
	var property image 
	const velocidad = 10
	const altoDeAreaDeColision
	const anchoDeAreaDeColision
	const colisionContraDino = 
				new AreaDeColision(
				altoDeArea = altoDeAreaDeColision, 
				anchoDeArea = anchoDeAreaDeColision,
				objPrincipal = self,
				objsQueColisionan = colisiones.objsQueColisionanContraItem(),
				accion = self.accionAlColisionar()
				)
	
	
	method iniciar(){
		game.addVisual(self)
		self.animar()
		colisiones.objsQueColisionanContraDino().add(self)
		colisiones.colisionesContraItem().add(colisionContraDino)
	}
	
	method accionAlColisionar()
	
	method animar(){
		game.onTick(10, "mover",{
				if(self.position().x() > -50){
					self.mover()
				}
				else{
					self.eliminar()
				}
				
			})
	}
	
	method mover(){
		position = position.left(velocidad)
	}
	
	method eliminar(){
			game.removeVisual(self)	
			game.removeTickEvent("mover")
			colisiones.objsQueColisionanContraDino().remove(self)			
			colisiones.colisionesContraItem().remove(colisionContraDino)			
	}
}

class Cactus inherits Obstaculo(
	altoDeAreaDeColision = 60,
	anchoDeAreaDeColision = 30,
	alturaDeSpawn = 10
) {
	override method accionAlColisionar(){
		return {game.stop()}
	}
}

class Ave inherits Obstaculo(
	altoDeAreaDeColision = 60,
	anchoDeAreaDeColision = 30,
	alturaDeSpawn = 150
){
	override method accionAlColisionar(){
		return {game.stop()}
	}
}

