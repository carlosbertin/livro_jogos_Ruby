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

def sorteia_numero_secreto
    puts "Escolhendo um número secreto entre 0 e 200..."
    sorteado = 175
    puts "Escolhido... que tal adivinhar hoje nosso número secreto ?"
    puts "\n\n"
    sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
    puts "Chutes até agora: #{chutes}"
    puts "Entre com o número"
    chute = gets
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

da_boas_vindas
numero_secreto = sorteia_numero_secreto

limite_de_tentativas = 5
chutes = []

for tentativa in 1..limite_de_tentativas
    chute = pede_um_numero(chutes, tentativa, limite_de_tentativas)
    chutes[chutes.size] << chute

    break if verifica_se_acertou(numero_secreto, chute)
end