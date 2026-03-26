# CRIA — Deploy e Manutenção

## Estrutura

```
/srv/containers/cria/
  app/    ← código da aplicação (clone/cópia dos arquivos .py e templates/)
  data/   ← banco de dados cria.db (nunca apagar)
```

## Primeiro deploy

```bash
# 1. Cria os diretórios
mkdir -p /srv/containers/cria/app
mkdir -p /srv/containers/cria/data

# 2. Copia o código
cp -r app.py models.py templates/ static/ /srv/containers/cria/app/

# 3. Copia o banco existente (se houver)
cp cria.db /srv/containers/cria/data/

# 4. Build da imagem (só precisa repetir se mudar requirements.txt)
docker build -t cria-app:latest .

# 5. Sobe o container
docker compose up -d
```

## Atualizar o código

```bash
cp -r app.py models.py templates/ static/ /srv/containers/cria/app/
docker restart cria
```

Sem rebuild. Sem perda de dados.

## Atualizar dependências (requirements.txt mudou)

```bash
docker build -t cria-app:latest .
docker compose up -d
```

## Logs

```bash
docker logs -f cria
```
