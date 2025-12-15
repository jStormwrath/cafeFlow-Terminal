import Foundation

//1. Uma struct (value type) - cópia independente
struct cardapioMesa {
  var precoCappuccino = 9.0
}

var mesa1 = cardapioMesa()
var mesa2 = mesa1 // <- mesa2 copia o conteúdo de mesa1
mesa2.precoCappuccino = 10.0

print("Mesa 1: R$ \(mesa1.precoCappuccino)") // -> 9.0
print("Mesa 2: R$ \(mesa2.precoCappuccino)") // 10.0

//2. Uma class (reference type) - mesma instância
class EstoqueCafe {
  var kilosRestantes = 10.0
}

let estoqueDaLoja = EstoqueCafe() // <- Só existe 1 estoque na loja
let baristaManha = estoqueDaLoja
let baristaTarde = estoqueDaLoja

baristaManha.kilosRestantes -= 3.0

print("Barista da tarde vê: \(baristaTarde.kilosRestantes) kgs") // <- 7.0

//3. Exemplo de descrição de propriedades numa classe
class Gerente {
  // Essas 3 linhas são PROPRIEDADES da classe Gerente
  var nome: String = "Ana"        // propriedade do tipo String
  var cafesVendidosHoje: Int = 0  // propriedade do tipo Int
  var salario: Double = 3000.0    // propriedade do tipo Double
}

let gerenteDaLoja = Gerente() // Cria o gerente

print(gerenteDaLoja.nome)               // -> Ana
gerenteDaLoja.cafesVendidosHoje += 7    // gerente vendeu 7 cafés hoje
print(gerenteDaLoja.cafesVendidosHoje)  // -> 7

/*4. Heranças classes: uma classe "filha" recebe tudo que a classe "pai" tem, e pode
adicionar mais coisas ou mudar comportamento

Exemplo:
classe pai: funcionario (tem nome, idade, salário)
classe filha: gerente (tem salário diferente do funcionário e pode aplicar desconto)
*/

class ProdutoBase {
  var nome: String
  var preco: Double

  init(nome: String, preco: Double) {
    self.nome = nome
    self.preco = preco
  }

  func descricao() -> String {
    return "\(nome) por R$ \(preco)"
  }
}

// <- Herança: ProdutoPremium É UM ProdutoBase, mas com mais coisas
//a. Cria-se a classe que herdará a classe inicial

class ProdutoPremium: ProdutoBase {

  /*※ a classe ProdutoPremium recebe a classe ProdutoBase como parâmetro, assim
  ProdutoPremiun fará uso das propriedades do ProdutoBase, sem necessidade de gerar
  duplicidade.*/
  
  var pontosFidelidade: Int

  init(nome: String, preco: Double, pontos: Int) {
    self.pontosFidelidade = pontos
    super.init(nome: nome, preco: preco) // chama o init da classe pai

    /*b. Usa-se as propriedades 'nome' e 'preco' de ProdutoBase, e inclui uma
    propriedade 'pontos' que é exclusiva de ProdutoPremium*/    
  }

  // Sobrescreve a descrição do pai
  override func descricao() -> String {
    return super.descricao() + "(+ \(pontosFidelidade) pontos fidelidade)"

    /*Suplementa a função descrição do ProdutoBase com uma descrição exclusiva de ProdutoPremium, fazendo uso de sua propriedade exclusiva 'pontosFidelidade'
    */
  }
}

let cappuccinoNormal = ProdutoBase(nome: "Cappuccino", preco: 9.0)
let cappuccinoPremiun = ProdutoPremium(nome: "Cappuccino Premiun", preco: 12.0, pontos: 50)

print(cappuccinoNormal.descricao())   // -> Cappuccino por 9.0
print(cappuccinoPremiun.descricao())  // -> Cappuccino Premium por R$12.0 (+ 50 pontos fidelidade)

/*O que é ciclo de vida de uma classe (deinit)?
Todo objeto (classe) nasce e um dia morre (quando ninguém mais aponta pra ela)
• init = 'nascimento' da classe (inicializador)
• deinit = 'morte' da classe (concluídor) -> roda automaticamente quando o objeto
é concluído.
Exemplo:*/

class CaixaDoDia {
  var dinheiro: Double = 0.0

  init() {
    print("Caixa aberto! Começando o dia com R$ \(dinheiro)")
  }

  deinit {
    print("Caixa fechado! Fechamento do dia: R$ \(dinheiro)")
  }
}

var caixa: CaixaDoDia? = CaixaDoDia()   // -> Imprimirá 'Caixa aberto!'
caixa?.dinheiro += 43.20
caixa = nil                             // <- objeto 'morre' aqui.
//Imprimirá 'Caixa fechado! Fechamento do dia R$: 43,20'

/*DESAFIO
1. Criar uma class AtendenteDaLoja com propriedades 'nome' e 'cafesVendidosHoje'
2. Criar duas variáveis apontando pro MESMO ATENDENTE e mostrar que a alteração de um
afeta o outro.
3. (Bônus) Criar uma classe ProdutoBase e uma classe ProdutoPremium que herda ela,
adicionando uma propriedade 'donoDaLoja: Bool'*/

// Desafio 1
class Funcionario {
  var nome: String
  var cafesVendidosHoje: Int = 0

  init(nome: String, cafesVendidosHoje: Int) {
    self.nome = nome
    self.cafesVendidosHoje = cafesVendidosHoje
  }

  func vendas() -> String {
    return "Funcioário(a) \(nome) já vendeu \(cafesVendidosHoje) hoje"
  }
}

let turnoDaManha = Funcionario(nome: "Ana", cafesVendidosHoje: 12)
print(turnoDaManha.vendas())
let turnoDaTarde = Funcionario(nome: "Vera", cafesVendidosHoje: 9)
print(turnoDaTarde.vendas())


//DESAFIO Bônus
class DonoDaLoja: Funcionario {
  var donoDaLoja: Bool

  init(nome: String, cafesVendidosHoje: Int, dono: Bool) {
    self.donoDaLoja = dono
    super.init(nome: nome, cafesVendidosHoje: cafesVendidosHoje)
  }

  override func vendas() -> String {
    return super.vendas() + " (E ele é o dono, hein!)"
  }
}

let donoDaLoja = DonoDaLoja(nome: "Paulo", cafesVendidosHoje: 1, dono: true)
print(donoDaLoja.vendas())
