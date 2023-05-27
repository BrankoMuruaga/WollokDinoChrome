import wollok.game.*

/* las imagenes de fondo deben del del ancho del lienzo */

class Background{
	const image
	const velocidad
	const altura = 0
	
	method iniciar(){
		self.animar()
	}
	
	method animar(){
		const posP = game.at(0, altura)
		const posS = game.at(game.width(), altura)
		
		const imagenPrincipal = new ImagenPrincipal(image = image, position = posP)
		const imagenSecundaria = new ImagenSecundaria(image = image, position = posS)
		
		const fondo = [imagenPrincipal, imagenSecundaria]
		
		fondo.forEach{e => game.addVisual(e)}
		
		game.onTick(velocidad, "background", {
			fondo.forEach{e => 
			e.position(e.position().left(velocidad))
			if(e.position().x() <= game.width() * -1){
				e.position(posS)
				}
			}
		})
	}
}

class ImagenPrincipal{
	var property image
	var property position
}

class ImagenSecundaria{
	var property image
	var property position
}
