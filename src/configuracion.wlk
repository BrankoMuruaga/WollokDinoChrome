import wollok.game.*
import dino.*
import obstaculo.*
import puntaje.*
import background.*
import colision.*

object configuracion {
	var property puntajeActual = 0
	
	method iniciar(){
		
		
		game.title("Dino Chrome")
		game.cellSize(1)
		game.width(1000)
		game.height(500)
	
		colisiones.verificarColisiones()
	
		dino.iniciar()
		
		self.controles()
		self.crearFondo()
		
		game.onTick(3000, "cactus", {
			const aveBaja = new Ave(alturaDeSpawn = 47)
			const aveAlta = new Ave()
			
			const cantidadDeCactus = ["1", "2", "3", "4", "5", "6"]
			const cactus = new Cactus(image = "cactus" + cantidadDeCactus.anyOne() + ".png")
			
			const obstaculo = [aveBaja, aveAlta, cactus]
			obstaculo.anyOne().iniciar()
		})
		
		puntaje.position(game.at( game.width() - 150 ,game.height() - 50))
		puntaje.agregarPuntaje(puntajeActual)
			
		
	}
	
	method controles(){
		keyboard.space().onPressDo{dino.saltar()}
	}
	
	method crearFondo(){
		const fondo = new Background(image = "suelo1.png", velocidad = 10)
		fondo.iniciar()
	}
	
	
}
