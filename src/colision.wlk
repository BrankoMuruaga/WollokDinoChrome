import wollok.game.*
object colisiones{
	/* Proposito: Verificar constantemente las colisiones del juego
	 * 
	 * Crear una nueva instancia de cada colision nueva y agregarla a la lista "colisiones"
	 */
	const property colisiones = []
	
	
	method verificarColisiones(){	
		game.onTick(100, "colision", {
			colisiones.forEach{c => c.iniciar()}
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
	 * 				objQueColisiona: un Objeto Posicionable - El objeto el cual se verificara si se produce una colision
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
	var objQueColisiona
	var accion
	var colisionActiva = true
	
	method desactivarColision(){
		colisionActiva = false
	}
	
	method activarColision(){
		colisionActiva = true
	}
	
	method iniciar(){
		self.colisionar(objPrincipal, objQueColisiona, accion)
	}
	
	method colisionar(objetoPrincipal, objetoQueColisiona, unClosure){
		/*
	 * Proposito:   Crea un area de colision partiendo desde la posicion de **objetoPrincipal**
	 *  			y con el alto y ancho indicado al momento de instanciar la clase
	 * 
	 * Parametros: 
	 * 				objetoPrincipal: El objeto el cual tendra el area de colision
	 * 				objetoQueColisiona: El objeto el cual se comprobara si esta dentro del area de **objetoPrincipal**
	 *				unClosure: La accion a realizar cuando ambos objetos colisionan
	 */
		if(self.estaEnColision(objetoPrincipal, objetoQueColisiona))unClosure.apply()
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
		
		
		return estaEnRangoXDeColision && estaEnRangoYDeColision && colisionActiva
	}
	
}
