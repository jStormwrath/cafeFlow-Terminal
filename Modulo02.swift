//Exercício de fixação
print("=== CaféFlow Terminal Edition ===")
print("Bem-vindo, @jStormwrath!\n")
print("Cardápio de hoje:")

let precoEspresso = 5.00
let precoCappuccino = 9.00
let precoLatte = 10.00

print("Espresso     -> R$\(precoEspresso)")
print("Cappuccino   -> R$\(precoCappuccino)")
print("Latte        -> R$\(precoLatte)\n")

print("Seu pedido atua:")

var quantidadeCappuccino = 2
var quantidadeLatte = 1

let totalCappuccino = Double(quantidadeCappuccino) * precoCappuccino
let totalLatte = Double(quantidadeLatte) * precoLatte
let totalAPagar = totalCappuccino + totalLatte

print("\(quantidadeCappuccino) x Cappuccino")
print("\(quantidadeLatte) X Latte")
print("Total a pagar: R$\(totalAPagar)")
print("Obrigado e volte sempre!")                  
