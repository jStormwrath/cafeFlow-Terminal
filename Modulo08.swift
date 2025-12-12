import Foundation

enum Cafe: String, CaseIterable {
  case espresso = "Espresso"
  case cappuccino = "Cappuccino"
  case latte = "Latte Macchiato"
  case mocha = "Mocha"

  var preco: Double {
    switch self {
      case .espresso:   return 5.0
      case .cappuccino: return 9.0
      case .latte:      return 10.0
      case .mocha:      return 12.0
    }
  }

  var temLeite: Bool {
    self != .espresso
  }

  var temChocolate: Bool {
    self == .mocha
  }

  var descricao: String {
    switch self {
      case .espresso:   return "Puro, preto e forte!"
      case .cappuccino: return "Café com leite com nome fresco (não tem canela, tá!)"
      case .latte:      return "Café com leite menos fresco"
      case .mocha:      return "O sujeito que prepara um achocolatado e esquece, colocando café depois"
    }
  }

  var tempoDePreparo: Int {
    switch self {
      case .espresso: 10
      case .cappuccino: 20
      case .latte: 15
      case .mocha: 35
    }
  }

  func infoCompleta() {
    print("• \(self.rawValue)")
    print("  Preço: R$ \(String(format: "%.2f", self.preco))")
    print("  \(self.tempoDePreparo) segundos para preparar")
    print("  \(self.descricao)\n")
  }
}

/* Uso mágico
print("=== CaféFlow - Cardápio oficial ===\n")
for cafe in Cafe.allCases {
  print("• \(cafe.rawValue)")
  print("  Preço: R$ \(cafe.preco)")
  print("  Tem leite: \(cafe.temLeite ? "sim" : "não")")
  print("  Tem chocolate: \(cafe.temChocolate ? "sim" : "não")\n")
}

DESAFIO do Modulo 8
Melhorar esse enum com:
• Uma propriedade 'descricao' que retorna uma string bonitinha.
• Uma propriedade 'tempoDePreparo' em segundos
• Um método 'infoCompleta()' que retorna uma string com tudo.

Exemplo de saída esperada:
• Espresso
  Preço: R$ 5.00
  30 segundos de preparo
  Café puro, forte e rápido!
*/

print("=== CaféFlow - Cardápio oficial ===")
for cafe in Cafe.allCases {
  cafe.infoCompleta()
}
