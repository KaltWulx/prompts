---
name: agent-design
description: Principios y mejores prácticas para diseñar agentes efectivos
license: MIT
compatibility: opencode
metadata:
  category: meta
  level: advanced
  tags: [agents, design, prompting, architecture]
---

# Agent Design

Guía para crear agentes de IA efectivos, coherentes y útiles.

## Principios Fundamentales

### 1. Propósito Único
Cada agente debe tener un objetivo claro y específico.

**✅ Bueno:**
- "Code Reviewer: Revisa código buscando bugs y malas prácticas"
- "API Designer: Diseña endpoints RESTful consistentes"

**❌ Evitar:**
- "Super Agent: Hace todo lo relacionado con código"
- Vaguedad: "Ayuda con desarrollo"

### 2. Identidad Clara
El agente debe saber quién es y qué representa.

**Componentes de Identidad:**
- Nombre memorable
- Personalidad profesional
- Expertise específico
- Limitaciones conocidas

**Ejemplo:**
```
Eres Code Reviewer, un senior developer con 10 años de 
experiencia. Especializado en detectar bugs de seguridad 
y optimización de performance.
```

### 3. Contexto de Colaboración
Documentar cómo interactúa con otros agentes.

**Ejemplo:**
```
Trabajas después de @lexis y antes de @Constructor.
Recibes análisis y produces planes ejecutables.
```

## Estructura de un Prompt de Agente

### 1. Header YAML (Frontmatter)
```yaml
---
description: Descripción clara para el usuario
mode: primary | subagent
temperature: 0.0 - 1.0
tools:
  read: true
  write: false
permissions:
  skill:
    "*": allow | deny | ask
---
```

### 2. Identidad (# Who You Are)
```markdown
# Nombre del Agente

Eres [Rol], [descripción de expertise].

## Propósito
[Una oración clara de tu objetivo principal]

## Principios
1. [Principio 1]
2. [Principio 2]
3. [Principio 3]
```

### 3. Capacidades (# What You Do)
Lista específica de tareas y responsabilidades.

### 4. Limitaciones (# What You Don't Do)
Claridad sobre qué está fuera de alcance.

### 5. Colaboración (# Working With Others)
Cómo interactúas con el ecosistema de agentes.

## Configuración de Herramientas

### Herramientas Disponibles
- `read`: Leer archivos
- `glob`: Buscar archivos por patrón
- `grep`: Buscar texto en archivos
- `write`: Crear archivos
- `edit`: Editar archivos existentes
- `bash`: Ejecutar comandos del sistema
- `websearch`: Buscar en web
- `webfetch`: Obtener contenido de URL
- `skill`: Usar skills disponibles

### Permisos
**Estrategias:**

**Restrictiva (por defecto):**
```yaml
tools:
  write: false
  bash: false
permissions:
  skill:
    "*": deny
    "specific-skill": allow
```

**Permisiva (para agentes de construcción):**
```yaml
tools:
  write: true
  edit: true
  bash: true
permissions:
  skill:
    "*": allow
```

## Temperatura (Temperature)

Controla creatividad vs. predictibilidad:

**0.0 - 0.2: Análisis y Precisión**
- Code review
- Análisis de requisitos
- Debugging
- Validación

**0.3 - 0.5: Desarrollo Balanceado**
- Implementación de features
- Refactorización
- Testing
- Documentación técnica

**0.6 - 0.8: Creatividad Controlada**
- Diseño de UX
- Brainstorming
- Solución de problemas abiertos
- Optimización

**0.9 - 1.0: Exploración Creativa**
- Generación de ideas
- Contenido creativo
- Prototipos experimentales
- Investigación blue-sky

## Modos de Agente

### Primary Agents
- Interacción directa con el usuario
- Acceso a través de Tab
- Visibles en UI
- Toman la iniciativa

### Subagents
- Invocados con @mention
- Especializados en tareas específicas
- Pueden ser hidden (ocultos del autocomplete)
- Llamados por primary agents

## Anti-Patrones

❌ **Evitar:**

1. **Prompts Excesivamente Largos**
   - Máximo 500-1000 tokens
   - Dividir en skills si es necesario

2. **Conflicto de Responsabilidades**
   - Dos agentes haciendo lo mismo
   - Responsabilidades borrosas

3. **Dependencias Circulares**
   - Agente A invoca a B que invoca a A

4. **Permisos Excesivos**
   - Toda herramienta habilitada "por si acaso"

5. **Vaguedad**
   - "Ayuda con código"
   - "Sé útil"
   - Sin dirección clara

## Checklist de Calidad

Antes de finalizar un agente:

- [ ] Propósito claro y específico
- [ ] Identidad bien definida
- [ ] Herramientas necesarias (solo las que usa)
- [ ] Temperatura apropiada
- [ ] Documentación de colaboraciones
- [ ] Ejemplos de input/output
- [ ] Limitaciones claras
- [ ] Permisos mínimos necesarios
- [ ] Posible probar en un caso real

## Ejemplos de Prompts Efectivos

**Ejemplo: Code Reviewer**
```markdown
Eres Code Reviewer, un senior engineer especializado en 
código limpio y seguro.

## Tu Trabajo
Revisar código buscando:
1. Bugs potenciales
2. Vulnerabilidades de seguridad
3. Malas prácticas
4. Oportunidades de optimización

## Output
Para cada issue encontrada:
- Ubicación exacta (archivo, línea)
- Severidad (Critical, High, Medium, Low)
- Explicación del problema
- Sugerencia de fix

## Lo Que NO Haces
- No reescribes código directamente
- No haces cambios sin aprobación
- No revisas estilo (formato, naming)

Foco en calidad y seguridad, no en preferencias personales.
```

**Ejemplo: UX Designer**
```markdown
Eres UX Designer, experto en experiencia de usuario.

## Tu Trabajo
Diseñar flujos de usuario intuitivos:
1. Entender necesidades del usuario
2. Mapear journey maps
3. Crear wireframes
4. Definir interacciones

## Principios
- Mobile-first
- Accesibilidad como default
- Simplicidad sobre features
- Datos > Opiniones

## Output
- User flows
- Wireframes descriptivos
- Anotaciones de interacción
- Consideraciones de accesibilidad

Trabajas antes de @designer-ui.
```

## Testing de Agentes

### Casos de Prueba
1. Input típico
2. Edge cases
3. Input ambiguo
4. Input fuera de alcance

### Validación
- ¿Mantiene su rol?
- ¿Usa herramientas correctamente?
- ¿Colabora bien con otros?
- ¿Respeta limitaciones?

Iterar basado en resultados reales de uso.
