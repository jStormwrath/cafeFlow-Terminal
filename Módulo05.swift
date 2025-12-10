import Foundation

/* Funções são especializações de um código.
Cada função exerce uma tarefa específica em que, em muitos casos, é esperado um
retorno, ou seja, um resultado do que a função realizou. */

print("=== CaféFlow com funcionários especializados ===\n")

//1. Função que calcula preço de um item
func precoDoItem(quantidade: Int, precoUnitario: Double) -> Double {
  return Double(quantidade) * precoUnitario
}

//2. Função que aplica desconto
func valorComDesconto(subtotal: Double, quantidadeItens: Int) -> Double {
  if quantidadeItens >= 5 {
    return subtotal * 0.90
  } else {
    return subtotal
  }
}

/* As funções 1 e 2 possuem um "-> Double" porque delas é esperado um valor como
resultado, de acordo com as operações realizadas dentro da função.
Quando a função necessita de um retorno, a espressão "return" é utilizada para
sinalizar ao compilador que aquele é o resultado esperado após o processamento.*/

//3. Função que mostra o recibo bonititnho
func exibirRecibo(nome: String, total: Double, comDesconto: Bool) {
  print("=== RECIBO FINAL ===")
  if comDesconto {
    print("Parabéns, \(nome)! Você ganhou 10% de desconto")
  }
  print("Total a pagar: R$ \(String(format: "%.2f", total))")
  print("Obrigado e volte sempre!")
}
/* Na função 3, ela apenas exibe os valores atribuidos a ela em uma formatação
específica, sendo a formatação dos valores o resultado esperado do processamento
da função, logo, nenhuma descrição sobre o que é esperado de resultado da função
é necessária; nem o uso do "return". */

//USANDO AS FUNÇÕES (o programa principal fica lindo e curto)
let nomeCliente = "Ana"
let qtdCappuccino = 2
let qtdLatte = 1
let qtdEspresso = 4
let quantidadeTotal = qtdCappuccino + qtdLatte + qtdEspresso

let totalCappuccino = precoDoItem(quantidade: qtdCappuccino, precoUnitario: 9.0)
let totalLatte      = precoDoItem(quantidade: qtdLatte, precoUnitario: 10.0)
let totalEspresso   = precoDoItem(quantidade: qtdEspresso, precoUnitario: 5.0)

let subtotal = totalCappuccino + totalLatte + totalEspresso
let totalFinal = valorComDesconto(subtotal: subtotal, quantidadeItens: quantidadeTotal)
let teveDesconto = quantidadeTotal >= 5

exibirRecibo(nome: nomeCliente, total: totalFinal, comDesconto: teveDesconto)

/* DESAFIO: Fazer um código que usa pelo menos 4 funções e gere a saída abaixo:
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
1. Programa principal com no máximo 20 linhas;
2. Usar 4 funções diferentes (cabeçalho, cálculo do item, desconto, recibo...) */

print("=== CaféFlow Terminal Edition ===")

//1. Função para imprimir o total dos itens
func imprimirPedido(_ produto: String, quantidade: Int) -> Double {
  switch produto {
      case "Cappuccino":
      let cappuccino = Double(quantidade) * 9.0
      print("• \(quantidade) x Cappuccino  ->  R$ \(String(format: "%.2f", cappuccino))")
      return cappuccino
    case "Latte":
      let latte = Double(quantidade) * 10.0
      print("• \(quantidade) x Latte       ->  R$ \(String(format: "%.2f", latte))")
      return latte
    case "Espresso":
      let espresso = Double(quantidade) * 5.0
      print("• \(quantidade) x Espresso    ->  R$ \(String(format: "%.2f", espresso))")
      return espresso
    default:
      print("Item não encontrado")
      return 0.0
  }
}

//2. Função que calcula o desconto
func totalComDesconto(_ subtotal: Double,_ totalDeItens: Int) -> Double {
  if totalDeItens >= 5 {
    print("Desconto 10%:     -> -R$ \(String(format: "%.2f", (subtotal * 0.10)))")
    return subtotal * 0.90
  } else {
    return subtotal
  }
}

//3. Função de saudação e comentários
func saudacao(_ nome: String, quantidadePedida: Int) {
  print("Seja bem-vindo(a), \(nome)!\n")
  if quantidadePedida >= 5 {
    print("Você pediu \(quantidadePedida) cafés hoje -> 10% de desconto automático!\n")
  } else {
    print("Faltaram \(5 - quantidadePedida) cafés para conseguir 10% de desconto automático.\n")
  }
}

//4. Função que emite o recibo
func emitirRecibo(_ nome: String, cappuccino: Int, latte: Int, espresso: Int) {
  let totalDePedidos = cappuccino + latte + espresso

  saudacao(nome, quantidadePedida: totalDePedidos)
  print("Detalhes do pedido:")
  let saldoCappuccino = imprimirPedido("Cappuccino", quantidade: 2)
  let saldoLatte = imprimirPedido("Latte", quantidade: 1)
  let saldoEspresso = imprimirPedido("Espresso", quantidade: 4)
  print("────────────────────────────")
  let saldoBruto = saldoCappuccino + saldoLatte + saldoEspresso
  print("Subtotal:         ->  R$ \(String(format: "%.2f", saldoBruto))")
  let saldoLiquido = totalComDesconto(saldoBruto, totalDePedidos)
  print("────────────────────────────")
  print("Total a pagar:    ->  R$ \(String(format: "%.2f", saldoLiquido))\n")
  print("Obrigado e volte sempre, \(nome)!")
}
emitirRecibo("Ana", cappuccino: 2, latte: 1, espresso: 4)
