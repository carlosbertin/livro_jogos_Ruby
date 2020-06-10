# rodando no rails c
# 2.5.0 :001 > require('maior_ou_menor')
def da_boas_vindas
    puts "Bem-vindo ao jogo da adivinhação"
    puts "Qual é o seu nome?"
    nome = gets
    puts "\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    puts "\n\n"
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    when
        maximo = 200
    end
    puts "Escolhendo um número secreto entre 1 e #{maximo}"
    sorteado = rand(maximo) + 1 # +1 porque rand escolhe valores entre 0 e 199 (não 200, caso fosse esse o máximo)
    puts "Escolhido... que tal adivinhar hoje nosso número secreto ?"
    puts "\n\n"
    sorteado
end

def pede_dificuldade
    puts "Qual o nível de dificuldade que deseja ?"
    gets.to_i
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
    puts "Chutes até agora: #{chutes}"
    puts "Entre com o número"
    chute = gets.strip
    puts "Será que você acertou ? Você chutou #{chute}"
    chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute

    if acertou
        puts "Acertou !"
        puts "\n\n"
        return true
    else
        maior = numero_secreto > chute
        if maior
            puts "O número secreto é maior!"
        else
            puts "O número secreto é menor!"
        end
        puts "\n\n"
        false
    end
end

def joga(nome, dificuldade)
    numero_secreto = sorteia_numero_secreto(dificuldade)

    limite_de_tentativas = 5
    chutes = []
    pontos_ate_agora = 1000

    for tentativa in 1..limite_de_tentativas
        chute = pede_um_numero(chutes, tentativa, limite_de_tentativas)
        chutes << chute
    
        pontos_a_perder = (chute - numero_secreto).abs / 2.0
        pontos_ate_agora = pontos_ate_agora - pontos_a_perder
    
        break if verifica_se_acertou(numero_secreto, chute)
    end

    puts "Você ganhou #{pontos_ate_agora} pontos."
end

def nao_quer_jogar?
    puts "Deseja joagar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
    joga(nome, dificuldade)
    break if nao_quer_jogar?
end