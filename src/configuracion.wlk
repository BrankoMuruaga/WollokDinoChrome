import wollok.game.*
import dino.*
import cactus.*
import puntaje.*
import background.*

object configuracion {
	method iniciar(){
		game.title("Dino Chrome")
		game.cellSize(1)
		game.width(1000)
		game.height(500)
	
		dino.iniciar()
		puntaje.iniciar()
		
		self.controles()
		self.crearFondoYCactus()
		
		
		
	}
	
	method controles(){
		keyboard.space().onPressDo{dino.saltar()}
	}
	
	
	method crearFondoYCactus(){
		const fondo = new Background(image = "suelo1.png", velocidad = 10)
		fondo.iniciar()
		game.onTick(2000, "agregarCactus", {
			const cactus = new Cactus(image = "cactus" + 1.randomUpTo(6).truncate(0).toString() + ".png")
			cactus.iniciar()
		})
	}
	
	
}
