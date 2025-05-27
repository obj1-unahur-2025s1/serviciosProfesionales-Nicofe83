class Empresa {
  var property honorarioDeReferencia
  const property profesionales = []
  const property clientes = #{}
  
  method contratar(unProfesional) {
    profesionales.add(unProfesional)
  }
  
  method cuantosEstudiaronEn(unaUniversidad) = profesionales.count(
    { p => p.universidad() == unaUniversidad }
  )
  
  method profesionalesCaros() = profesionales.filter(
    { p => p.honorarios() > honorarioDeReferencia }
  ).asSet()
  
  method universidadesFormadoras() = profesionales.map(
    { p => p.universidad() }
  ).asSet()
  
  method profesionalMasBarato() = profesionales.min({ p => p.honorarios() })
  
  method esDeGenteAcotada() = profesionales.all(
    { p => p.provinciaDondeTrabaja().size() <= 3 }
  )
  
  method puedeSatisfacerA(unSolicitante) = profesionales.any(
    { p => unSolicitante.puedeSerAtendidoPor(p) }
  )
  
  method darServicio(unSolicitante) {
    if (self.puedeSatisfacerA(unSolicitante)) {
      const unProf = profesionales.find(
        { p => unSolicitante.puedeSerAtendidoPor(p) }
      )
      unProf.cobrar(unProf.honorarios())
      clientes.add(unSolicitante)
    }
  }
  
  method cantidadDeCLientes() = clientes.size()
  
  method tieneDeClienteA(unSolicitante) = clientes.contains(unSolicitante)
  
  method esProfecionalPocoAtractivo(unProfesional) {
    const provinciasProf = unProfesional.provinciasDondeTrabaja().asSet()
    const profMismasProv = profesionales.find(
      { p => p.provinciasDondeTrabaja().asSet() == provinciasProf.asSet() }
    )
    return profMismasProv.any(
      { p => p.honorarios() < unProfesional.honorarios() }
    )
  }
}