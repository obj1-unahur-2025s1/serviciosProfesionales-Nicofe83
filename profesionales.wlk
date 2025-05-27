class ProfesionalVinculado {
  const property universidad
  
  method honorarios() = universidad.honorariosRecomendados()
  
  method provinciasDondeTrabaja() = [universidad.provincia()]
  
  method cobrar(unImporte) = universidad.recibirDonacion(unImporte / 2)
}

class ProfesionalAsociado {
  var property universidad
  
  method honorarios() = 3000
  
  method provinciasDondeTrabaja() = ["Entre Rios", "Santa Fe", "Corrientes"]
  
  method cobrar(unImporte) {
    asociacion.recibirDonacion(unImporte)
  }
}

class ProfesionalLibre {
  var property universidad
  const property provinciasDondeTrabaja = []
  var property honorarios
  var cobros = 0
  
  method agregarProvincia(unaProvincia) {
    provinciasDondeTrabaja.add(unaProvincia)
  }
  
  method cobrar(unImporte) {
    cobros += unImporte
  }
  
  method pasarCantidad(unProfesional, unaCantidad) {
    cobros -= unaCantidad
    unProfesional.cobrar(unaCantidad)
  }
}

object asociacion {
  var recaudacion = 0
  
  method recibirDonacion(unImporte) {
    recaudacion += unImporte
  }
}