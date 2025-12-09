print("=== CaféFlow Terminal Edition ===")
var clienteNome = "Ana"
var opcaoCliente = 1
var quantidadePedidos = 7

let cardapio = ["Espresso", "Cappuccino", "Latte"]
let precos = [5.0, 9.0, 10.0]

let quantidadeCappuccino = 2
let quantidadeLatte = 1
let quantidadeEspresso = 4

var totalEspresso: Double = 0.0
totalEspresso = Double(quantidadeEspresso) * precos[0]
var totalCappuccino: Double = 0.0
totalCappuccino = Double(quantidadeCappuccino) * precos[1]
var totalLatte: Double = 0.0
totalLatte = Double(quantidadeLatte) * precos[2]

print("Bem-vindo(a), \(clienteNome)\n")
print("1) Fazer pedido\n")
print("2) Ver recibo\n")
print("3) Sair\n")

print("Digite a sua opção: \(opcaoCliente)")
switch opcaoCliente {
  case 1:
  print("Você escolheu fazer pedido!")
  case 2:
  print("=== Seu pedido atual ===")
  case 3:
  print("Obrigado e volte sempre!")
  default:
  print("Não foi possível registrar sua solicitação")
}

print("Quantos cafés deseja? \(quantidadePedidos)")

var totalSemDesconto: Double = 0.0
totalSemDesconto = totalEspresso + totalCappuccino + totalLatte

var valorDesconto: Double = 0.0
valorDesconto = totalSemDesconto

var totalComDesconto: Double = 0.0
totalComDesconto = totalSemDesconto

if quantidadePedidos >= 5 {
  print("Você ganhou 10% de desconto por comprar \(quantidadePedidos) itens!")
  valorDesconto *= 0.10
  totalComDesconto *= 0.90
} else {
  print("Infelizmente não houve desconto hoje")
}

print("=== Seu pedido atual ===")
print("\(quantidadeCappuccino) X \(cardapio[1])     -> R$ \(totalCappuccino)")
print("\(quantidadeLatte) X \(cardapio[2])          -> R$ \(totalLatte)")
print("\(quantidadeEspresso) X \(cardapio[0])       -> R$ \(totalEspresso)")
print("Desconto 10%       -> -R$ \(valorDesconto)")
print("-------------------")
print("Total a pagar: R$ \(totalComDesconto)")
