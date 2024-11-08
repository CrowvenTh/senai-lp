**Git** é um sistema de controle de versão, usado para rastrear mudanças em arquivos. O Git permite que os desenvolvedores trabalhem de maneira colaborativa e eficiente, mantendo um histórico completo de alterações em um repositório. O Git é distribuído, o que significa que cada desenvolvedor tem uma cópia completa do repositório em sua máquina.Principais conceitos do Git:

- **Repositório**: Um diretório onde o Git rastreia o histórico de versões de um projeto.

- **Commit**: Uma captura do estado do código em um ponto no tempo.

- **Branch**: Uma ramificação no repositório, permitindo que desenvolvedores trabalhem em diferentes funcionalidades ou correções de forma isolada.

- **Merge**: Combinar mudanças de diferentes branches.

- **Clone**: Copiar um repositório remoto para o local.

- **Pull/Push**: Trazer mudanças de um repositório remoto (pull) ou enviar suas mudanças para ele (push).

## Comandos

verificar se existe usuário e e-mail configurado

    git config user.name
    git config user.email

    git config user.name "${Seu Nome}"
    git config user.email "${seuemail@exemplo.com}"

verifica qual o vinculo remoto do projeto no github

    git remote -v

    echo "${alguma mensagem}" >> README.md
    git init
    git add README.md
    git status
    git commit -m "${mensagem do commit}"
    git config --list
    git clone https://github.com/${usuario}/${projeto}.git
    git remote rm origin
    git branch -M ${nome-branch}
    git remote add origin https://github.com/${usuario}/${projeto}.git
    git push -u origin ${nome-branch}
    git checkout ${nome-da-branch}
    git pull
    git log