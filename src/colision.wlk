import wollok.game.*

/* Cada cosa que quieras que colisione con el personaje hay que añadirlo a la lista de objetos que colisionan
 * dentro del objeto colisiones
 * 
 * colisiones.objsQueColisionanContraHeroe().add(enemigo)
 * 
 * 
 * Para golpes del heroe contra el enemigo se puede hacer lo siguiente
 * 
 * keyboard.space().onPressDo{
				game.addVisual(objetoColision)
				colisiones.objsQueColisionanContraEnemigo().add(objetoColision)
				game.schedule(1,{
					game.removeVisual(objetoColision)
					colisiones.objsQueColisionanContraEnemigo().remove(objetoColision)
				})
		}
   Donde "objetoColision" es un objeto de un pixel con una imagen transparente.
   Este aparece y desaparece en un instante, produciendo en el enemigo el efecto requerido solo una vez
  
   Ya que el heroe siempre pega en un mismo lugar, la posicion en la que va a aparecer el objeto 
   puede ser siempre la misma
 */
 
 
object colisiones{
	/* Proposito: Verificar constantemente las colisiones del juego
	 * 
	 * Crear una nueva instancia de cada colision y agregarla a la lista "colisiones"
	 */
	 
	const property objsQueColisionanContraDino = [] 
	const property objsQueColisionanContraItem = [] 
	
	const property colisionesContraDino = []
	const property colisionesContraItem = []
	
	
	method verificarColisiones(){	
		game.onTick(10, "colision", {
			colisionesContraDino.forEach{c => c.colisionar()}
			colisionesContraItem.forEach{c => c.colisionar()}
		})
		
	}
			
}

class AreaDeColision {
	/*	Proposito: Crea un area partiendo de la posicion de **objPrincipal**, en la que si entra **objQueColisiona**
	 *  		   se ejecutara **accion**
	 * 
	 * 	Parametros: 
	 * 				altoDeArea: un Numero - El alto que tendra el area de la colision
	 * 				anchoDeArea: un Numero - El ancho que tendra el area de la colision
	 * 				objPrincipal: un Objeto Posicionable - El objeto en el cual se generara el area
	 * 				objQueColisiona: una lista de Objetos Posicionables - Los objeto contra los que se verificara si se produce una colision
	 * 				accion: un Closure - La accion a realizar una vez se produzca la colision
	 * 
	 * 				-opcional-
	 * 				colisionActiva: un booleano - Si el area de colision esta activa o no 
	 * 											  (De estar activa se ejecuta el closure **accion** una vez el
	 * 												objeto **objQueColisiona** entre en el area)
	 */
	
	
	var altoDeArea
	var anchoDeArea
	var objPrincipal
	var objsQueColisionan
	var accion
	var colisionActiva = true
	
	method desactivarColision(){
		colisionActiva = false
	}
	
	method activarColision(){
		colisionActiva = true
	}
	
	method colisionar(){
		/*
	 * Proposito:   Crea un area de colision partiendo desde la posicion de **objetoPrincipal**
	 *  			y con el alto y ancho indicado al momento de instanciar la clase
	 */
	 
	 	const algunoEstaEnColision = objsQueColisionan.any{o => self.estaEnColision(objPrincipal, o)}
		if(algunoEstaEnColision){
			accion.apply()			
		}
	}
	
	method estaEnColision() = objsQueColisionan.any{o => self.estaEnColision(objPrincipal, o)}
	
	method objetoEnColision(){
		return objsQueColisionan.find{o => self.estaEnColision(objPrincipal, o)}
	}
	
	method estaEnColision(objetoPrincipal, objetoQueColisiona){
	/*
	 * Proposito:   Crea un area de colision partiendo desde la posicion de **objetoPrincipal**
	 *  			y con el alto y ancho indicado al momento de instanciar la clase
	 * 
	 * Parametros: 
	 * 				objetoPrincipal: El objeto el cual tendra el area de colision
	 * 				objetoQueColisiona: El objeto el cual se comprobara si esta dentro del area de **objetoPrincipal**
	 */
		const posX_ObjetoPrincipal = objetoPrincipal.position().x()
		const posY_ObjetoPrincipal = objetoPrincipal.position().y()
		const posX_ObjetoQueColisiona = objetoQueColisiona.position().x()
		const posY_ObjetoQueColisiona = objetoQueColisiona.position().y()
		
		const estaEnRangoXDeColision = posX_ObjetoQueColisiona <=  posX_ObjetoPrincipal + anchoDeArea && posX_ObjetoQueColisiona >= posX_ObjetoPrincipal    
		const estaEnRangoYDeColision = posY_ObjetoQueColisiona <=  posY_ObjetoPrincipal + altoDeArea && posY_ObjetoQueColisiona >=  posY_ObjetoPrincipal
		
		
		return colisionActiva && estaEnRangoXDeColision && estaEnRangoYDeColision
	}
	
}
