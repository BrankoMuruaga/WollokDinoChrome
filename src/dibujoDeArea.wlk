import wollok.game.*

class AreaDeColisiones{
	var property objetoBase
	var property areaDeColision
	const velocidad
	const property posicionBase = game.at(objetoBase.position().x(), objetoBase.position().y())
	
	var property y = areaDeColision.alto()
	var property x = areaDeColision.ancho() - 1

	const limitesEnX = []
	const limitesEnY = []

	const property limites = []
	
	method moverArea(){
		posicionBase.left(velocidad)
	}

	method crearArea(){
		self.crearLimites()
		self.dibujarLimites()	
	}

	method eliminarAreaDeColision(){
		limites.forEach{limite => game.removeVisual(limite)}
		limites.clear()
	}

	method dibujarLimites(){
		limites.forEach{limite => game.addVisual(limite)}
	}

	method crearLimites(){
		self.crearLimitesEnX()
		self.crearLimitesEnY()
		
		limites.addAll(limitesEnX)
		limitesEnX.clear()
		limites.addAll(limitesEnY)
		limitesEnY.clear()
		
	}

	method crearLimitesEnX(){
		if(x > 0){
			limitesEnX.add(new ObjetoDeColision(position = game.at(posicionBase.x() + x, posicionBase.y())))
			limitesEnX.add(new ObjetoDeColision(position = game.at(posicionBase.x() + x, posicionBase.y() + y)))
			x--
			self.crearLimitesEnX()
		}
		else{
			x = areaDeColision.ancho()
		}
	}
	
	method crearLimitesEnY(){
		if(y > -1){
			limitesEnY.add(new ObjetoDeColision(position = game.at(posicionBase.x(), posicionBase.y() + y)))
			limitesEnY.add(new ObjetoDeColision(position = game.at(posicionBase.x() + x, posicionBase.y() + y)))
			y--
			self.crearLimitesEnY()
		}
		else{
			y = areaDeColision.alto()
		}
	}

	
}

class ObjetoDeColision{
	var property position
	var property image = "areaDeColision.png"
}




// Se crea una nueva area. Area.px(25, 25) - Devuelve un objeto Medida 

object area inherits Medida{
	method px(unAltoEnPx, unAnchoEnPx) = new Medida(alto = unAltoEnPx, ancho = unAnchoEnPx)
}

class Medida{
	var property alto = 0
	var property ancho = 0
}
