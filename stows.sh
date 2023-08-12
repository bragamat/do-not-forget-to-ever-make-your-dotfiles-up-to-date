#/bin/bash

for dot in "./*"; do
  if [ -d "$dot" ]; then
    # Comando que você deseja executar para cada pasta
    # Substitua "seu_comando" pelo comando que você deseja executar
    stow "$dot"
  fi
done
