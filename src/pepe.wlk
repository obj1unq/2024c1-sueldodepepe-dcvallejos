object pepe {
	//sueldo = neto + bono x resultados + bono x presentismo.
	
	var categoria = cadete
	var diasAusentismo = 0
	var bonoXResultado = nulo
	var bonoXPresentismo = nulo
	
	method sueldo(){
		return self.neto() + self.totalBonos()
	}
	
	method totalBonos(){
		return bonoXResultado.valor(self) + bonoXPresentismo.valor(self)
	}
	
	method diasAusentismo(){
		return diasAusentismo
	}
		
	method bonoXResultado(_bonoXResultado){
		bonoXResultado = _bonoXResultado
	}
		
	method bonoXPresentismo(_bonoXPresentismo){
		bonoXPresentismo = _bonoXPresentismo
	}
	
	method bonoXPresentismo(){
		return bonoXPresentismo 
	}
	
	method diasAusentismo (_diasAusentismo){
		diasAusentismo = _diasAusentismo
	}
	
	method categoria(_categoria){
		categoria = _categoria
	}
	
	method neto(){
		return categoria.neto()
	}
}

object sofia{
	var bonoXResultado = nulo
	const diasAusentismo = 0
	var categoria = cadete


	method sueldo(){
		return self.neto() + bonoXResultado.valor(self)
	}
	
	method diasAusentismo(){
		return diasAusentismo
	}
		
	method bonoXResultado(_bonoXResultado){
		bonoXResultado = _bonoXResultado
	}
	
	method categoria(_categoria){
		categoria = _categoria
	}
	
	method neto(){
		return categoria.neto() * self.diferencialNeto()
	}	
	
	method diferencialNeto(){
		return 1.3
	}
}

object roque{
	
	const neto = 28000
	var bonoXResultados = nulo

	
	method neto(){
		return neto
	}
	
	method sueldo(){
		return self.neto() + self.bonos()
	}
	
	method bonos(){
		return bonoXResultados.valor(self) + self.bonoFijo()
	}
	
	method bonoXResultados(_bonoXResultados){
		bonoXResultados = _bonoXResultados
	}
	
	method bonoFijo(){
		return 9000
	}
}

object ernesto{
	var companiero = roque
	const diasAusentismo = 0
	var bonoXPresentismo = pepe.bonoXPresentismo()
	
	method neto(){
		return companiero.neto()
	}
	
	method sueldo(){
		return self.neto() + bonoXPresentismo.valor(self)
	}
	
	method bonoXPresentismo(_bonoXPresentismo){
		bonoXPresentismo = _bonoXPresentismo
	}
	method diasAusentismo(){
		return diasAusentismo
	}
	
	method companiero(_companiero){
		companiero = _companiero
	}
}



// Bonos por resultados

object porcentaje{
	
	method valor(empleado){
		return empleado.neto() * self.porcentaje()
	}
	
	method porcentaje(){
		return 0.1
	}
}

object montoFijo{
	method valor(neto){
		return 800
	}
}

// Bonos por presentismo

object normal{
	method valor(empleado){
		if(empleado.diasAusentismo() > 1) return 0
		else if(empleado.diasAusentismo() == 1) return 1000
		else return 2000
		
	}
}

object ajuste{
	method valor(empleado){
		if (empleado.diasAusentismo() == 0
		) return 100
		else return 0
	}
}

object demagogico{
	
	method valor(empleado){
		return if (empleado.neto() < 18000) {500} else {300}		
	}
}

// Tipo nulo con posibilidad de 1 y 2 parametros

object nulo{
	method valor(empleado){
		return 0
	}
}

// Categorias

object vendedor{
	
	const netoBase = 16000
	var muchasVentas = false
	
	method neto(){
		return if (muchasVentas) {netoBase * 1.25} else {netoBase}
	}
	
	method activarAumentoPorMuchasVentas(){
		muchasVentas = true
	}
	
	method desactivarAumentoPorMuchasVentas(){
		muchasVentas = false
	}
}

object medioTiempo{
	
	var categoriaBase = cadete
	
	method categoriaBase(_categoriaBase){
		categoriaBase = _categoriaBase
	}
	
	method neto(){
		return categoriaBase.neto() / 2
	}
	
}

object gerente{
	method neto(){
		return 15000
	}
}

object cadete{
	method neto(){
		return 20000
	}	
}


