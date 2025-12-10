import Foundation

/*O struct cria um formato fechado para um tipo de dado.
No exemplo abaixo, "Produto" possui nome, preço e características específicas; estes itens são compartilhados
por todos os outros itens que utilizarem "Produto" como sua 'forma' de dados.
*/
//1. A ficha oficial do produto
struct Produto {
  let nome: String
  let preco: Double
  let temLeite: Bool
  let temCanela: Bool
}

//2. Criando os produtos do cardápio (agora é só uma linha cada!)
/* Cada valor agora carrega consigo todas as caracteristicas do "Produto", fazendo com que o valor
receba todos os elementos do produto em um única instância. Ou seja, cada valor abaixo discrimina
todos os itens necessários para classificar o "produto"; não sendo possível omití-los.
*/
let expresso = Produto(nome: "Espresso", preco: 5.0, temLeite: false, temCanela: false)
let chappuccino = Produto(nome: "Cappuccino", preco: 9.0, temLeite: true, temCanela: false)
let lhatte = Produto(nome: "Latte", preco: 10.0, temLeite: true, temCanela: true)

//3. Usando a struct (olha que lindo fica)
/* Cada valor que utiliza "Produto" como base, consegue acessar os elementos do "Produto" através da
estrutura [valor.elemento], restringindo seus dados apenas ao uso esclusivo do valor como referência.
*/
print("=== Cardápio oficial ===")
print("• \(expresso.nome)       -> R$ \(String(format: "%.2f", expresso.preco))")
print("• \(chappuccino.nome)     -> R$ \(String(format: "%.2f", chappuccino.preco))")
print("• \(lhatte.nome)          -> R$ \(String(format: "%.2f", lhatte.preco))")

//4. Função que agora recebe Produto inteiro (não números soltos)
func precoTotalDoItem(produto: Produto, quantidade: Int) -> Double {
  return produto.preco * Double(quantidade)
}

let total = precoTotalDoItem(produto: chappuccino, quantidade: 3)
print("3 cappuccinos = R$ \(String(format: "%.2f", total))")

/*DESAFIO: criar um código que use struct Produto e pelo menos uma função, e gere exatamente esta saída:
=== CaféFlow Terminal Edition ===

Bem-vindo(a), Ana!

Você pediu 7 cafés hoje → 10% de desconto automático!

Detalhes do pedido:
• 2 × Cappuccino → R$ 18.00
• 1 × Latte      → R$ 10.00
• 4 × Espresso   → R$ 20.00
────────────────────────────
Subtotal:         R$ 48.00
Desconto 10%:    -R$  4.80
────────────────────────────
Total a pagar:    R$ 43.20

Obrigado e volte sempre, Ana!

Regras:
1. Criar a struct Produto
2. Criar 3 instâncias (espresso, cappuccino, latte)
3. Usar uma função que receba Produto e quantidade
4. Usar outra função para calcular desconto (o reutilizar a do Módulo 5)
5. Programa principal limpo e elegante */

//1. Fazendo a struct
struct Product {
  let name: String
  let price: Double
  let hasMilk: Bool
  let hasCinnammon: Bool
}

//2. Criando as instâncias
let espresso = Product(name: "Espresso", price: 5.0, hasMilk: false, hasCinnammon: false)
let cappuccino = Product(name: "Cappuccino", price: 9.0, hasMilk: true, hasCinnammon: false)
let latte = Product(name: "Latte", price: 10.0, hasMilk: true, hasCinnammon: true)

//3. Criando as funções
//a. saudação e coleta do pedido (função principal)
func processarPedido(_ nome: String, qtdCappuccino: Int, qtdLatte: Int, qtdEspresso: Int) {
  print("=== CaféFlow Terminal Edition ===\n")
  print("Bem-vindo(a), \(nome)!\n")

  let totalDoPedido = qtdCappuccino + qtdLatte + qtdEspresso
  let temDesconto = verificarDesconto(quantidade: totalDoPedido)

  print("Detalhes do pedido:")
  let saldoCappuccino = calcularItem(item: cappuccino, quantidade: 2)
  let saldoLatte      = calcularItem(item: latte, quantidade: 1)
  let saldoEspresso   = calcularItem(item: espresso, quantidade: 4)

  print("────────────────────────────")
  let saldoParcial = saldoCappuccino + saldoLatte + saldoEspresso
  let saldoFinal = aplicarDesconto(saldoDoPedido: saldoParcial, temDesconto: temDesconto)

  print("────────────────────────────")
  print("Total a pagar:   R$ \(String(format: "%.2f", saldoFinal))\n")
  print("Obrigado e volte sempre, \(nome)!")
}

//b. calcular o valor total do item pela quantidade
func calcularItem(item: Product, quantidade: Int) -> Double {
  let result: Double = Double(quantidade) * item.price
  print("• \(quantidade) x \(item.name) - R$ \(String(format: "%.2f", result))")
  return result
}

//c. sinaliza se o cliente pode ou não receber desconto
func verificarDesconto(quantidade: Int) -> Bool {
  if quantidade >= 5 {
    print("Você pediu \(quantidade) cafés hoje -> 10% de desconto automático!\n")
    return true
  } else {
    print("Com mais \(5 - quantidade) cafés você ganharia 10% de desconto automático!\n")
    return false
  }
}

//.d calcula o desconto do cliente
func aplicarDesconto(saldoDoPedido: Double, temDesconto: Bool) -> Double {
  print("Subtotal:        R$ \(String(format: "%.2f", saldoDoPedido))")
  if temDesconto {
    print("Desconto 10%     -R$ \(String(format: "%.2f", (saldoDoPedido * 0.10)))")
    return saldoDoPedido * 0.90
  } else {
    return saldoDoPedido
  }
}

//Execução
processarPedido("Ana", qtdCappuccino: 2, qtdLatte: 1, qtdEspresso: 4)
