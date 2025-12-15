/* Módulo 10: collections mutáveis: adicionar, remover e editar itens
Objetivo:
• Adicionar cafés no carrinho
• Remover ou alterar quantidades
• Calcular total automaticamente
• Tudo de forma segura e idiomatic Swift
*/

import Foundation

struct Produto: Hashable {
  let nome: String
  let preco: Double
}

let cappuccino = Produto(nome: "Cappuccino",  preco: 9.0)
let latte      = Produto(nome: "Latte",       preco: 10.0)
let espresso =   Produto(nome: "Espresso",    preco: 5.0)

//1. Carrinho começa vazio
var carrinho: [Produto: Int] = [:]

//2. Adicionar itens
carrinho[cappuccino] = 2                  // forma direta
carrinho[latte, default: 0] += 1          // forma segura (não da erro se não existir)
carrinho[espresso, default: 0] += 4

print(carrinho)  
// -> [Produto("Cappuccino"):2, Produto("Latte"):1, Produto("Espresso"):4]

//3. Alterar quantidade
carrinho[cappuccino] = 3                  // muda de 2 pra 3
carrinho[latte]! += 1                     // outra forma (cuidado com '!')

//4. Remover item
carrinho[latte] = nil
//ou
carrinho.removeValue(forKey: cappuccino)

//5. Verificar se tem item
if carrinho[espresso] != nil {
  print("Tem \(carrinho[espresso]!) espressos")
  // Tem 4 espressos
}

//6. Calcular total (loop mágico)
var total: Double = 0
for (produto, quantidade) in carrinho {
  total += produto.preco * Double(quantidade)
}

print("Total do carrinho R$ \(String(format: "%.2f", total))")
// Total do carrinho R$ 36.00

/* DESAFIO DO DIA
Criar uma classe CarrinhoDaMesa com:
• uma propriedade: itens: [Produto: Int] = [:]
• Métodos
  a. adicionar(_ produto: Produto, quantidade: Int = 1)
  b. remover(_ produto: Produto)
  c. alterarQuantidade(_ produto: Produto, para novaQuantidade: Int)
  d. total() -> Double
  e. ImprimirComanda() -> Imprimir exatamente como o recibo que a gente já conhece
  f* Adicionar um desconto automático se o total de itens >= 5
  */

class CarrinhoDaMesa {
  var itens: [Produto: Int] = [:]
  
  func adicionar(_ produto: Produto, quantidade: Int = 1) {
    itens[produto, default: 0]
    print(itens)
  }
}

var mesaQuatro = CarrinhoDaMesa()
mesaQuatro.adicionar(cappuccino, quantidade: 2)
