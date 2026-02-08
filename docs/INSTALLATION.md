# Guía de Instalación

Guía completa para instalar y configurar el OpenCode Compendium.

## Requisitos Previos

- OpenCode CLI instalado ([https://opencode.ai](https://opencode.ai))
- Git
- Bash (Linux/macOS) o Git Bash (Windows)
- jq (opcional, para perfiles avanzados)

## Métodos de Instalación

### Método 1: Instalación Global con Symlinks (Recomendado)

Ideal para uso personal en tu máquina.

```bash
# 1. Clonar el repositorio
git clone https://github.com/tu-usuario/opencode-compendium.git ~/opencode-compendium

# 2. Entrar al directorio
cd ~/opencode-compendium

# 3. Instalar todo
./install.sh --global

# O instalar un perfil específico
./install.sh --global --profile=development
```

**Ventajas:**
- Los cambios en el repo se reflejan inmediatamente
- Fácil actualización con `./sync.sh`
- Un solo lugar de verdad

### Método 2: Instalación Global con Copia

Para máquinas donde no quieres mantener el repo.

```bash
./install.sh --global --copy
```

**Ventajas:**
- No dependencia del repo local
- Puedes modificar archivos sin afectar el repo

**Desventajas:**
- Requiere reinstalar para actualizar
- Ocupa más espacio

### Método 3: Instalación por Proyecto (Submódulo)

Ideal para proyectos específicos con configuraciones particulares.

```bash
# 1. En tu proyecto
git submodule add https://github.com/tu-usuario/opencode-compendium.git .opencode/compendium

# 2. Instalar localmente
cd .opencode/compendium
./install.sh --local
```

**Ventajas:**
- Cada proyecto puede tener versión diferente
- Configuraciones específicas por proyecto
- Reproducible en cualquier máquina

### Método 4: Instalación Selectiva

Instala solo lo que necesitas.

```bash
# Instalar un agente específico
./install-agent.sh agents/_primary/lexis.md --global

# Instalar una skill específica
./install-skill.sh skills/_core/git-workflow --global

# Instalar múltiples agentes manualmente
./install-agent.sh agents/_primary/architect.md --global
./install-agent.sh agents/_primary/Constructor.md --global
```

## Perfiles de Instalación

### ¿Qué es un Perfil?

Un perfil es una configuración predefinida que instala un conjunto específico de agentes y skills.

### Perfiles Disponibles

#### full
Todo el compendium.

```bash
./install.sh --global --profile=full
```

**Incluye:**
- Todos los agentes (6 primarios + 1 subagente)
- Todas las skills

#### development
Flujo de desarrollo completo.

```bash
./install.sh --global --profile=development
```

**Incluye:**
- Lexis (Análisis)
- Architect (Planificación)
- Constructor (Ejecución)
- Zeteo (Investigación)
- Skills de desarrollo, arquitectura y core

#### design
Diseño UX/UI.

```bash
./install.sh --global --profile=design
```

**Incluye:**
- Designer-UX
- Designer-UI
- Zeteo
- Skills de diseño

#### meta
Meta-agentes para crear el sistema.

```bash
./install.sh --global --profile=meta
```

**Incluye:**
- Prometheus (con sus 3 makers internos)
- Zeteo
- Skills de meta-creación

#### minimal
Lo esencial.

```bash
./install.sh --global --profile=minimal
```

**Incluye:**
- Lexis (Análisis)
- Constructor (Ejecución)
- Prometheus (Meta-creación)
- Skills core

## Verificación de Instalación

Después de instalar, verifica que todo funcione:

```bash
# Listar agentes instalados
ls ~/.config/opencode/agents/

# Listar skills instaladas
ls ~/.config/opencode/skills/

# En OpenCode, presiona Tab para ver agentes disponibles
# Deberías ver: Lexis, Architect, Constructor, Designer-UX, Designer-UI, Prometheus
```

## Actualización

### Con Symlinks (Método recomendado)

```bash
cd ~/opencode-compendium
./sync.sh
```

Esto:
1. Hace `git pull` de los últimos cambios
2. Recrea los symlinks para nuevos agentes/skills

### Con Copia

```bash
cd ~/opencode-compendium
git pull
./install.sh --global --copy
```

## Desinstalación

```bash
./uninstall.sh --global
```

Esto remueve todos los symlinks/copias creados por el compendium.

## Solución de Problemas

### Los agentes no aparecen en OpenCode

1. Verifica la instalación:
   ```bash
   ls ~/.config/opencode/agents/
   ```

2. Reinicia OpenCode

3. Verifica permisos:
   ```bash
   ls -la ~/.config/opencode/agents/
   ```

### Symlinks rotos

Si mueves el repositorio, los symlinks se rompen. Solución:

```bash
cd ~/opencode-compendium
./sync.sh
```

### Conflictos con agentes existentes

Si ya tienes agentes con el mismo nombre:

1. Haz backup de tus agentes actuales
2. Decide cuáles quieres conservar
3. Usa instalación selectiva en lugar de completa

## Configuración Avanzada

### Personalizar un Perfil

Edita `profiles/{nombre}.json`:

```json
{
  "name": "mi-perfil",
  "description": "Mi configuración personal",
  "agents": [
    "agents/_primary/lexis.md",
    "agents/_primary/Constructor.md"
  ],
  "skills": [
    "skills/_core/*",
    "skills/development/*"
  ]
}
```

### Usar en CI/CD

```yaml
# .github/workflows/opencode.yml
steps:
  - uses: actions/checkout@v3
  - name: Install OpenCode Compendium
    run: |
      git clone https://github.com/tu-usuario/opencode-compendium.git
      cd opencode-compendium
      ./install.sh --global --profile=minimal
```

## Soporte

- Issues: [GitHub Issues](https://github.com/tu-usuario/opencode-compendium/issues)
- Documentación: [docs/](docs/)
