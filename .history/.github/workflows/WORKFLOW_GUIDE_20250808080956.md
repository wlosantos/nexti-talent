# Git Workflow Strategy

## 🔄 Branch Protection Strategy

### Current Configuration

#### CI Workflow (`ci.yml`)
```yaml
on:
  push:
    branches: ["develop"]          # Testes rodam apenas no develop
  pull_request:
    branches: ["develop", "main"]  # Testes rodam em PRs para ambos
```

#### Deploy Workflow (`deploy.yml`)
```yaml
on:
  push:
    branches: ["main"]  # Deploy roda apenas no main
```

## 📋 Recommended Workflow

### 1. Development Process
```bash
# Desenvolvedores trabalham em feature branches
git checkout -b feature/nova-funcionalidade
git commit -m "feat: adiciona nova funcionalidade"
git push origin feature/nova-funcionalidade
```

### 2. Integration Testing
```bash
# Pull request para develop
# ✅ CI executa automaticamente
# ✅ Testes passam → merge aprovado
# ❌ Testes falham → merge bloqueado
```

### 3. Production Release
```bash
# Após testes passarem no develop
git checkout main
git merge develop
git push origin main
# ✅ Deploy workflow executa automaticamente
```

## 🛡️ GitHub Branch Protection Rules

Para garantir que o fluxo seja seguido, configure estas regras no GitHub:

### Branch: `develop`
- ✅ Require status checks to pass before merging
- ✅ Require branches to be up to date before merging
- ✅ Required status checks: `test`, `lint`, `system-tests`
- ✅ Restrict pushes that create commits that do not pass required status checks

### Branch: `main`
- ✅ Require status checks to pass before merging
- ✅ Require pull request reviews before merging
- ✅ Restrict pushes (apenas via Pull Request de develop)
- ✅ Required status checks: `test`, `lint`, `system-tests`

## 🔧 How to Set Up Branch Protection

1. Vá para **Settings** → **Branches** no seu repositório
2. Clique em **Add rule** para cada branch
3. Configure as regras conforme descrito acima

## 📈 Benefits of This Approach

- **Segurança**: Apenas código testado chega ao `main`
- **Qualidade**: Todos os commits passam por CI/CD
- **Rastreabilidade**: Histórico claro de releases
- **Reversibilidade**: Fácil rollback em caso de problemas

## 🚫 What This Prevents

- ❌ Push direto para `main` sem testes
- ❌ Deploy de código com bugs
- ❌ Quebra da branch principal
- ❌ Releases não testadas

## 💡 Pro Tips

1. **Squash commits** ao fazer merge para manter histórico limpo
2. **Use conventional commits** para changelog automático
3. **Configure webhooks** para notificações de deploy
4. **Implemente feature flags** para releases graduais
