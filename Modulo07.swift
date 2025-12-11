import Foundation

/* struct Produto: Hashable {
  let nome: String
  let preco: Double
}

//1. Array = prateleira oficial do cardápio
let cardapio: [Produto] = [
  Produto(nome: "Espresso",   preco: 5.0),
  Produto(nome: "Cappuccino", preco: 9.0),
  Produto(nome: "Latte",      preco: 10.0)
]

//2. Dicionário = carrinho de compras do cliente
var carrinhoDoCliente: [Produto: Int] = [
  cardapio[1]: 2, // 2 Cappuccinos
  cardapio[2]: 1, // 1 Latte
  cardapio[0]: 4 // 4 espressos
]

//3. Loop mágico que imprime tudo sozinho
print("=== Detalhes do pedido ===")
var subtotal: Double = 0

for (produto, quantidade) in carrinhoDoCliente {
  let valorItem = produto.preco + Double(quantidade)
  subtotal += valorItem
  print("• \(quantidade) x \(produto.nome) -> R$ \(String(format: "%.2f", valorItem))")
}

print("Subtotal: R$ \(String(format: "%.2f", subtotal))")

Desafio
Escrever um codigo que gere exatamente esta saída usando 'array' e 'dictionary':

=== CaféFlow Terminal Edition ===

Bem-vindo(a), Ana!

Você pediu 7 cafés hoje → 10% de desconto automático!

Detalhes do pedido:
• 2 × Cappuccino → R$  18.00
• 1 × Latte      → R$  10.00
• 4 × Espresso   → R$  20.00
────────────────────────────
Subtotal:         R$  48.00
Desconto 10%:    -R$   4.80
────────────────────────────
Total a pagar:    R$  43.20

Obrigado e volte sempre, Ana! ☕

Regras:
1. Um array
2. Um dicionário
3. Loop 'for' para imprimir os itens
4. Funções necessárias
5. Programa principal com no máximo 5 linhas (ou 3?)
*/

//1. Struct dos produtos
struct Produto: Hashable {
  let nome: String
  let preco: Double
}

//2. Array com a lista de produtos da cafeteria
let cardapio: [Produto] = [
  Produto(nome: "Cappuccino", preco: 9.0),
  Produto(nome: "Latte",      preco: 10.0),
  Produto(nome: "Espresso",   preco: 5.0)
]

//3. Dicionário que armazena o pedido do cliente, na estrutura 'produto: quantidade'
 var carrinhoDoCliente: [Produto: Int] = [
  cardapio[0]: 2,
  cardapio[1]: 1,
  cardapio[2]: 4,
 ]

//4. Função para calcular o pedido do cliente
func calculaPedido(pedido: [Produto: Int]) {
  var totalDeItens: Int = 0
  var saldoParcial: Double = 0
  var descricaoDoItem: [String] = []
  var valorDesconto: Double = 0
  
  for (produto, quantidade) in pedido {
    let saldoDoItem = produto.preco * Double(quantidade)
    saldoParcial += saldoDoItem
    totalDeItens += quantidade
    descricaoDoItem.append("• \(quantidade) x \(produto.nome) -> R$ \(String(format: "%.2f", saldoDoItem))")
  }

  var mensagemDesconto: String = ""
  if totalDeItens >= 5 {
    valorDesconto = saldoParcial * 0.10
    mensagemDesconto = "Você pediu \(totalDeItens) cafés hoje -> 10% de desconto automático!\n"
  } else {
    mensagemDesconto = "Mais \(5 - totalDeItens) cafés para 10% de desconto.\n"
  }

  let total = saldoParcial - valorDesconto

  //Emissão do recibo
  print("\(mensagemDesconto)\n")
  print("Detalhes do pedido:")
  for item in descricaoDoItem {
    print(item)
  }
  print("────────────────────────────")
  print("Subtotal:      R$ \(String(format: "%.2f", saldoParcial))")
  print("Desconto 10%:  R$ -\(String(format: "%.2f", valorDesconto))")
  print("────────────────────────────")
  print("Total a pagar: R$ \(String(format: "%.2f", total))\n")
}

//5. Função de saudação ao cliente
func saudacao(_ nome: String) {
  print("=== CaféFlow Terminal Edition ===\n")
  print("Bem-vindo(a), \(nome)")

  calculaPedido(pedido: carrinhoDoCliente)

  print("Obrigado e volte sempre, \(nome)!")
}

//6. Código principal
saudacao("Ana")
