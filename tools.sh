#!/bin/bash
-------------------------------
echo "Bem vindo ao Tools JP"
-------------------------------
# Função para exibir o menu
function exibir_menu {
  echo "1) Opção 1"
  echo "2) Opção 2"
  echo "3) Opção 3"
  echo "4) Opção 4"
  echo "5) Opção 5"
  echo "6) Sair"
}
----------------------------
# Loop principal
while true; do
  exibir_menu
  read -p "Escolha uma opção: " opcao

  case $opcao in
    1)
      echo "Você escolheu a Opção 1."
        echo "Verificando atualizações..."
sudo apt-get update > /dev/null 2>&1

UPDATES=$(aptitude search '~U' | wc -l)

if [ "$UPDATES" -eq 0 ]
then
    echo "Seu sistema está atualizado!"
else
    echo "Há $UPDATES atualizações disponíveis."
fi
      ;;
    2)
      echo "Você escolheu a Opção 2."
        echo "Seu endereço IP é:"
        hostname -I
      ;;
    3)
      echo "Você escolheu a Opção 3."
        echo "Listando todos os processos em execução:"
        ps -aux
      ;;
    4)
      echo "Você escolheu a Opção 4."
        echo "Limpando o cache do sistema:"
        sudo sync
        echo 3 | sudo tee /proc/sys/vm/drop_caches
      ;;
    5)
      echo "Você escolheu a Opção 5."
        echo "Desfragmentando o sistema de arquivos:"
        sudo e4defrag /dev/sda1
      ;;

    6)
      echo "Saindo..."
      break
      ;;
    *)
      echo "Opção inválida. Tente novamente."
      ;;
  esac
done
