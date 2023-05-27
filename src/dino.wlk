import wollok.game.*



object dino {
	var property position
	var property image = "dino3.png"
	
	
	method iniciar(){
		self.position(game.at(50, 10))
		game.addVisualCharacter(self)
		game.onTick(150, "animacion",{self.animarDino()}) 
		
		
	}
	
	method animarDino(){
		if (image == "dino3.png"){
			image = "dino4.png"
		}
		else if(image == "dino4.png"){
			image = "dino3.png"
		}
	}


	method saltar(){
    var subir = true;
    const posicionInicial = position.y();
    const posicionFinal = posicionInicial + 200;
    var velocidad = 20
    
    game.onTick(5, "salto", {
        if (position.y() < posicionFinal && subir){
            position = position.up(velocidad)
            velocidad -= 0.1
        } else {
            subir = false;
            velocidad += 0.1
            position = position.down(velocidad);
            if (position.y() <= posicionInicial){
            	position = game.at(position.x(), posicionInicial);
                game.removeTickEvent("salto");
            }
       	}
   		})
	}

}
