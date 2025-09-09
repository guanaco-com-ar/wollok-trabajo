object lista {
  var property granjaLista = []
  
  method mostrarSed() = self.granjaLista().filter({ a => a.tieneSed() })
  
  method mostrarHambre() = self.granjaLista().filter({ a => a.tieneHambre() })
}

class Animales {
  var peso = 0
  var sed = false
  var contadorComidas = 0
  var hambre = true
  var vacunasRecibidas = 0
  const vacunasNecesarias = 1
  
  method addGranja(lista) {
    lista.granjaLista().add(self)
  }
  
  method comer(alimento) {
    
  }
  
  method caminar() {
    
  }
  
  method tieneHambre() = hambre
  
  method tieneSed() = sed
  
  method beber() {
    sed = false
    contadorComidas = 0
  }
  
  method recibirVacuna(dosis) {
    if (self.estaEnfermo()) {
      console.println("El animal esta enfermo y ya no puede recibir vacunas")
    } else {
      vacunasRecibidas += dosis
    }
  }
  
  method estaEnfermo() {
    if ((1.randomUpTo(10) == 5) and (vacunasRecibidas < vacunasNecesarias)) {
      return true
    } else {
      return false
    }
  }
  
  method reproducir(otroAnimal) {
    if (lista.granjaLista().contains(self) && lista.granjaLista().contains(
      otroAnimal
    )) {
      const tipo = 1.randomUpTo(3)

      
      
      if (tipo == 1) {
        var hijoVaca = new Vaca()
        hijoVaca.addGranja(lista)
      } else {
        if (tipo == 2) {
          var hijoCerdo = new Cerdo()
          hijoCerdo.addGranja(lista)
        } else {
          var hijoGallina = new Gallina()
          hijoGallina.addGranja(lista)
        }
      }
      
      console.println("Ha nacido un nuevo animal.")
    } else {
      console.println(
        "Ambos animales deben estar en la lista para reproducirse"
      )
      return null
    }
  }
}

class Vaca inherits Animales (peso = 50) {
  override method comer(alimento) {
    peso += alimento / 2
    sed = true
    
    if (peso < 400) {
      hambre = true
    } else {
      hambre = false
    }
  }
  
  override method caminar() {
    peso -= 3
  }
  
  override method beber() {
    sed = false
    peso -= 1
  }
}

class Cerdo inherits Animales (peso = 30, vacunasNecesarias = 0) {
  override method comer(alimento) {
    peso += alimento - 5
    contadorComidas += 1
    if (contadorComidas == 3) {
      sed = true
    }
    
    if (peso < 200) {
      hambre = true
    } else {
      hambre = false
    }
    return hambre
  }
}

class Gallina inherits Animales (peso = 4, hambre = false) {
  override method comer(alimento) {
    peso += 0
  }
  
  override method recibirVacuna(dosis) {
    
  }
  
  override method estaEnfermo() = false
}