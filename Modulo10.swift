import Foundation

//  Usando o enum do módulo 8
enum Cafe: String, CaseIterable {
  case espresso   = "Espresso"
  case cappuccino = "Cappuccino"
  case latte      = "Latte Macchiato"
  case mocha      = "Mocha"

  var preco: Double {
    switch self {
      case .espresso:   return 5.0
      case .cappuccino: return 9.0
      case .latte:      return 10.0
      case .mocha:      return 12.0
    }
  }
}

//A Class que vai guardar o carrinho vivo
class CarrinhoDaMesa {
  var itens: [Cafe: Int] = [:] // começa vazio

  //1. Adicionar (quantidade padrão = 1)
  func adicionar(_ cafe: Cafe, quantidade: Int = 1) {
    itens[cafe, default: 0] += quantidade
    print("Adicionado \(quantidade) x \(cafe.rawValue)")
  }

  //2. Remover completamente
  func remover(_ cafe: Cafe) {
    if itens[cafe] != nil {
      itens.removeValue(forKey: cafe)
      print("Removido \(cafe.rawValue) do carrinho")
    } else {
      print("\(cafe.rawValue) não estava no carrinho")
    }
  }

  //3. Alterar quantidade (pode ser 0 para remover)
  func alterarQuantidade(de cafe: Cafe, para novaQuantidade: Int) {
    if novaQuantidade <= 0 {
      remover(cafe)
    } else {
      itens[cafe] = novaQuantidade
      print("Quantidade de \(cafe.rawValue) alterada para \(novaQuantidade)")
    }
  }

  //4. Calcular total de itens e valor
  private var totalDeItens: Int {
    itens.values.reduce(0, +)
  }

  var subtotal: Double {
    itens.reduce(0.0) {soma, par in
      soma + (par.key.preco * Double(par.value))
      }
  }

  var totalComDesconto: Double {
    totalDeItens >= 5 ? subtotal * 0.90 : subtotal
  }

  //5. Imprimir comanda bonita
  func imprimirComanda() {
    print("\n=== COMANDA DA MESA ===\n")
    if itens.isEmpty {
      print("Carrinho vazio")
    } else {
      for (cafe, qtd) in itens.sorted(by: {$0.key.preco > $1.key.preco}) {
        let valor = cafe.preco * Double(qtd)
        let nomePadded = cafe.rawValue.padding(toLength: 15, withPad: " ", startingAt: 0)
        print("• \(qtd) x \(nomePadded) -> R$ \(String(format: "%.2f", qtd, cafe.rawValue as NSString, valor))")
      }
      print("──────────────────────────────────")
      print("Subtotal:                R$ \(String(format: "%.2f", subtotal))")
      if totalDeItens >= 5 {
        let valorDesconto = subtotal * 0.10
        print("Desconto 10%            -R$ \(String(format:"%2.2f", valorDesconto))")
      }
      print("──────────────────────────────────")
      print("Total a pagar:           R$ \(String(format: "%.2f", totalComDesconto))")
    }
  }
}

//Programa principal
let carrinhoMesa5 = CarrinhoDaMesa()
carrinhoMesa5.adicionar(.cappuccino, quantidade: 2)
carrinhoMesa5.adicionar(.latte)
carrinhoMesa5.adicionar(.espresso, quantidade: 4)

carrinhoMesa5.imprimirComanda() //-> Total: R$48.80 com desconto R$43.20

carrinhoMesa5.remover(.latte)
carrinhoMesa5.alterarQuantidade(de: .cappuccino, para: 1)
carrinhoMesa5.imprimirComanda() //-> novo total sem desconto
