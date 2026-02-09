# OpenCode Compendium

Un compendio completo de agentes y skills para OpenCode, diseñado para ser agnóstico de stack, paradigma y tipo de problema.

## 🎯 Visión

Crear un ecosistema de agentes de IA especializados que trabajen juntos para resolver cualquier tipo de problema técnico o de diseño, independientemente del stack tecnológico utilizado.

## 📦 Contenido

### Agentes Primarios (8)

| Agente | Emoji | Rol | Descripción |
|--------|-------|-----|-------------|
| **Lexis** | 📖 | Análisis | Analiza requerimientos y contexto de forma agnóstica |
| **Architect** | 🏛️ | Planificación | Diseña arquitecturas y planes de implementación |
| **Constructor** | 🏗️ | Ejecución | Implementa soluciones en cualquier stack |
| **Designer-UX** | 🎨 | UX | Diseña flujos de usuario e interacciones |
| **Designer-UI** | 🎨 | UI | Crea interfaces visuales y sistemas de diseño |
| **Prometheus** | 🔥 | Meta | Orquesta la creación de agentes y skills |
| **Virgilio** | 📜 | Guía | Guía intelectual de análisis y decisiones complejas |
| **Prompt-Maker** | ✏️ | Optimización | Transforma prompts vagos en estructuras efectivas |

### Subagentes (1)

| Agente | Emoji | Rol |
|--------|-------|-----|
| **Zeteo** | 🔎 | Investigación y búsqueda de información |

### Subagentes Internos (2)

Estos son gestionados por Prometheus y no son visibles directamente:
- **Agent-Maker**: Crea nuevos agentes
- **Skill-Maker**: Crea nuevas skills

## 🚀 Instalación Rápida

### Opción 1: Instalación Global (Recomendada)

```bash
# Clonar el repositorio
git clone https://github.com/tu-usuario/opencode-compendium.git ~/opencode-compendium
cd ~/opencode-compendium

# Instalar todo
./install.sh --global

# O instalar un perfil específico
./install.sh --global --profile=development
```

### Opción 2: Instalación por Perfil

```bash
# Desarrollo (Lexis, Architect, Constructor)
./install.sh --global --profile=development

# Diseño (Designer-UX, Designer-UI)
./install.sh --global --profile=design

# Meta (Prometheus y makers)
./install.sh --global --profile=meta

# Mínimo (Lexis, Constructor, Prometheus)
./install.sh --global --profile=minimal

# Completo (todo)
./install.sh --global --profile=full
```

### Opción 3: Instalación Selectiva

```bash
# Instalar solo un agente
./install-agent.sh agents/_primary/lexis.md --global

# Instalar solo una skill
./install-skill.sh skills/_core/git-workflow --global
```

### Opción 4: Instalación Local (por proyecto)

```bash
# En tu proyecto
git submodule add https://github.com/tu-usuario/opencode-compendium.git .opencode/compendium
cd .opencode/compendium
./install.sh --local
```

## 📋 Perfiles Disponibles

- **full**: Todos los agentes y skills
- **development**: Flujo de desarrollo completo (Lexis → Architect → Constructor)
- **design**: Diseño UX/UI
- **meta**: Meta-agentes para crear y mejorar el sistema
- **minimal**: Lo esencial (Lexis, Constructor, Prometheus)

## 🔄 Actualización

Después de hacer `git pull` para obtener actualizaciones:

```bash
./sync.sh
```

Esto recreará los symlinks para cualquier agente o skill nuevo.

## 🎮 Uso

### Cambiar entre Agentes Primarios

Presiona **Tab** en OpenCode para alternar entre agentes primarios:
1. Lexis (Análisis)
2. Architect (Planificación)
3. Constructor (Ejecución)
4. Designer-UX (Diseño de flujos)
5. Designer-UI (Diseño visual)
6. Prometheus (Meta-creación)

### Invocar Subagentes

Usa `@` seguido del nombre del subagente:

```
@zeteo investiga las últimas tendencias en React 19
```

### Flujo de Desarrollo Típico

```bash
# 1. Análisis
@lexis analiza este proyecto y sus requerimientos

# 2. Planificación
@architect crea un plan basado en el análisis anterior

# 3. Ejecución
@Constructor implementa el plan propuesto
```

### Diseño UX/UI

```bash
# 1. UX - Flujos y wireframes
@designer-ux diseña el flujo de usuario para un checkout

# 2. UI - Visual
@designer-ui crea el sistema visual basado en los wireframes
```

### Meta-Creación con Prometheus

```bash
# Crear un nuevo agente
@prometheus crea un agente para revisar código Go

# Crear una skill
@prometheus crea una skill sobre testing en React

# Optimizar un prompt
@prometheus mejora este prompt: "haz un buen código"
```

## 🏗️ Arquitectura

### Flujo de Trabajo Principal

```
Lexis (Análisis) → Architect (Plan) → Constructor (Ejecución)
        ↑                                    ↓
        └──────────── Zeteo (Investigación) ←┘
```

### Diseño

```
Designer-UX (Flujos) → Designer-UI (Visual)
```

### Meta-Sistema

```
Usuario → Prometheus → [Agent-Maker | Skill-Maker | Prompt-Maker]
```

## 📚 Estructura del Repositorio

```
opencode-compendium/
├── agents/
│   ├── _primary/          # Agentes primarios (visibles con Tab)
│   ├── _subagents/        # Subagentes (invocados con @)
│   └── _internal/         # Subagentes internos de Prometheus
├── skills/
│   ├── _core/             # Skills fundamentales
│   ├── design/            # Skills de diseño
│   ├── architecture/      # Skills de arquitectura
│   ├── development/       # Skills de desarrollo
│   ├── meta/              # Skills para meta-creación
│   └── research/          # Skills de investigación
├── profiles/              # Perfiles de instalación
├── templates/             # Plantillas para crear agentes/skills
├── docs/                  # Documentación
└── *.sh                   # Scripts de instalación
```

## 🛠️ Crear Nuevos Agentes/Skills

### Crear un Agente

1. Copia `templates/AGENT_TEMPLATE.md`
2. Personaliza el frontmatter y el prompt
3. Guarda en `agents/_primary/` o `agents/_subagents/`
4. Ejecuta `./sync.sh`

### Crear una Skill

1. Crea carpeta en `skills/{categoria}/{nombre-skill}/`
2. Crea `SKILL.md` con frontmatter válido
3. Agrega contenido markdown
4. Ejecuta `./sync.sh`

## 🤝 Contribuir

1. Fork el repositorio
2. Crea tu agente o skill
3. Prueba localmente con `./install.sh --local`
4. Submit un Pull Request

## 📄 Licencia

MIT License - Libre para usar y modificar.

## 🙏 Créditos

Creado para la comunidad OpenCode.
