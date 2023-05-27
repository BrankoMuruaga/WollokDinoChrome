import wollok.game.*

class Cactus {
	var property position = game.at(game.width() + 20, 10)
	var property image 
	var velocidad = 10
	
	method iniciar(){
		game.addVisual(self)
		self.animar()
		self.colisionar()
	}
	
	method animar(){
		game.onTick(velocidad, "cactus",{
			if(position.x() > -50){
				position = position.left(velocidad)
			}
			else{
				game.removeVisual(self)	
			    game.removeTickEvent("cactus")			
			}
		})
	}
	
	method colisionar(){
		game.whenCollideDo(self, {e =>
		game.stop()
	})
	}
}

