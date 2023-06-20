import wollok.game.*
import dino.*
import cactus.*
import puntaje.*
import background.*
import colision.*

object configuracion {
	
	
	method iniciar(){
		game.title("Dino Chrome")
		game.cellSize(1)
		game.width(1000)
		game.height(500)
	
		colisiones.verificarColisiones()
	
		dino.iniciar()
		
		self.controles()
		self.crearFondo()
		
		game.onTick(1000, "cactus", {
			const cactus = new Cactus(image = "cactus" + 1.randomUpTo(6).truncate(0).toString() + ".png")
			const colisionContraCactus = 
				new AreaDeColision(
				altoDeArea = 90, 
				anchoDeArea = 90,
				objPrincipal = dino,
				objQueColisiona = cactus,
				accion = {game.stop()}
				)
			colisiones.colisiones().add(colisionContraCactus)
			cactus.iniciar()
			
		})
		
		
		
		var contador = 0
		puntaje.position(game.at( game.width() - 150 ,game.height() - 50))
		game.onTick(500 ,"puntaje", {
			puntaje.agregarPuntaje(contador)
			contador++
		})
		game.onTick(500 ,"puntaje", {
			console.println(colisiones.colisiones())
		})
		
			
		
	}
	
	method controles(){
		keyboard.space().onPressDo{dino.saltar()}
	}
	
	method crearFondo(){
		const fondo = new Background(image = "suelo1.png", velocidad = 10)
		fondo.iniciar()
	}
	
	
}
