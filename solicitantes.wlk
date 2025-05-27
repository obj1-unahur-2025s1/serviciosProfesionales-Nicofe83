class Persona {
  var property provinciaDondeVive
  
  method puedeSerAtendidapor(
    unProfesional
  ) = unProfesional.provinciaDondeTrabaja().contains(provinciaDondeVive)
}

class Institucion {
  const property universidades = []
  
  method agregarUniversidad(unaUniversidad) {
    universidades.add(unaUniversidad)
  }
  
  method puedeSerAtendidapor(unProfesional) {
    universidades.contains(unProfesional.universidad())
  }
}

class Club {
  const property provinciasDondeEsta
  
  method agregarProvincia(unaProvincia) {
    provinciasDondeEsta.add(unaProvincia)
  }
  
  method puedeSerAtendidapor(unProfesional) {
    !provinciasDondeEsta.asSet().intersection(
      unProfesional.provinciaDondeTrabaja().asSet()
    ).isEmpty()
  }
}