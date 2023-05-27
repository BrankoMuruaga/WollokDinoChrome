import wollok.game.*

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
