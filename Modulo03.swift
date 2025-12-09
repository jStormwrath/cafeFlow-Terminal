print("=== CafêFlow Terminal Edition ===")
print("Bem-vindo!\n")

var nomeDoCliente: String? = nil
nomeDoCliente = "Ana"
let precoEspresso = 5.00
let precoCappuccino = 9.00
let precoLatte = 10.00

print("Cardápio:")
print("1) Espresso      R$\(precoEspresso)")
print("2) Cappuccino    R$\(precoCappuccino)")
print("3) Latte         R$\(precoLatte)\n")

let quantidadeCappuccino = 2
let quantidadeLatte = 1
let totalCappuccino = Double(quantidadeCappuccino) * precoCappuccino
let totalLatte = Double(quantidadeLatte) * precoLatte
let total = totalCappuccino + totalLatte

print("Você quer açúcar? (responda com a quantidade de sachês ou deixe em branco para nenhum)\n")
var quantidadeDeSaches: Int? = nil
quantidadeDeSaches = 3
if let quantidade = quantidadeDeSaches {
  print("[Simulação] Cliente respondeu: \(quantidade)\n")
} else {
  print("Cliente ainda não decidiu\n")
}

print("=== Recibo ===")
print("\(quantidadeCappuccino) X Cappuccino")
print("\(quantidadeLatte) X Latte")
print("Açúcar: \(quantidadeDeSaches ?? 0) sachês")
print("Total: R$\(total)\n")
print("Obrigado, \(nomeDoCliente ?? "visitante")!")
