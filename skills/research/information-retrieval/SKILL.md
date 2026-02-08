---
name: information-retrieval
description: Estrategias efectivas para buscar y recuperar información
license: MIT
compatibility: opencode
metadata:
  category: research
  level: intermediate
  tags: [research, search, information, analysis]
---

# Information Retrieval

Técnicas y estrategias para encontrar información relevante y confiable.

## Estrategias de Búsqueda

### 1. Búsqueda Precisa
**Cuándo usar:** Conoces exactamente qué buscas.

**Técnicas:**
- Frases exactas: `"machine learning"`
- Exclusion: `python -snake`
- Site específico: `site:github.com authentication`
- Tipo de archivo: `filetype:pdf`

**Ejemplo:**
```
"React hooks" site:react.dev best practices
```

### 2. Búsqueda Exploratoria
**Cuándo usar:** Tema amplio, necesitas entender el landscape.

**Técnicas:**
- Términos generales
- Palabras clave relacionadas
- Sinónimos
- Conceptos padre/hijo

**Ejemplo:**
```
state management React alternatives
```

### 3. Búsqueda de Soluciones
**Cuándo usar:** Tienes un problema específico.

**Técnicas:**
- Error messages exactos
- Síntomas del problema
- Stack/versión específica
- Palabras: "how to", "solution", "fix"

**Ejemplo:**
```
React useEffect infinite loop dependency array solution
```

## Evaluación de Fuentes

### Credibilidad
**✅ Fuentes Confiables:**
- Documentación oficial
- Papers académicos revisados
- Blogs de mantenedores/core team
- GitHub repos oficiales

**⚠️ Fuentes con Cautela:**
- Stack Overflow (verificar fecha y votos)
- Medium/Dev.to (verificar autoridad del autor)
- Tutoriales de YouTube (verificar fecha)

**❌ Evitar:**
- Sin fecha (posiblemente obsoleto)
- Sin autor identificado
- Sitios con exceso de ads
- Contenido generado automáticamente

### Actualidad
Verificar fechas:
- Tecnología: < 1 año ideal
- Mejores prácticas: < 2 años
- Conceptos fundamentales: pueden ser más antiguos

### Consistencia
- ¿Múltiples fuentes dicen lo mismo?
- ¿Contradice documentación oficial?
- ¿Hay consenso en la comunidad?

## Técnicas Avanzadas

### Búsqueda Inversa
Parte de la solución, encuentra el problema:
```
"useCallback" "dependency array" solution
```

### Búsqueda Comparativa
Comparar alternativas:
```
Redux vs Zustand vs Jotai 2024
```

### Búsqueda de Recursos
Encontrar herramientas/librerías:
```
best React form libraries github stars
```

### Búsqueda de Expertos
Encontrar authorities:
```
"Dan Abramov" React best practices
```

## Síntesis de Información

### Proceso
1. **Recopilar**: Guardar fuentes relevantes
2. **Evaluar**: Verificar credibilidad
3. **Comparar**: Cruzar información
4. **Sintetizar**: Consolidar hallazgos
5. **Presentar**: Organizar de forma clara

### Estructura de Hallazgos
```
## Resumen Ejecutivo
[2-3 oraciones de conclusiones principales]

## Hallazgos Detallados

### [Tema 1]
- Punto clave 1
- Punto clave 2
- Fuente: [link]

### [Tema 2]
- Punto clave 1
- Punto clave 2
- Fuente: [link]

## Fuentes Consultadas
1. [Título](url) - Autor, Fecha
2. [Título](url) - Autor, Fecha

## Recomendaciones
[Basado en evidencia encontrada]
```

## Búsqueda en Repositorios

### GitHub
**Búsquedas útiles:**
- `stars:>1000 language:python`: Repos populares en Python
- `topic:machine-learning`: Repos con ese topic
- `filename:docker-compose.yml`: Buscar archivos específicos
- `path:src/components`: Buscar en paths específicos

### Documentación
**Tácticas:**
- Usar search interno de docs
- Revisar changelog/migration guides
- Checar issues y PRs para edge cases
- Leer source code cuando sea necesario

## Búsqueda Académica

### Google Scholar
- Papers revisados por pares
- Citas para verificar influencia
- Related works para contexto

### arXiv
- Preprints de CS, ML, etc.
- Acceso libre
- Versiones actualizadas

## Anti-Patrones

❌ **Evitar:**
1. **Confirmation Bias**: Solo buscar lo que confirma tu hipótesis
2. **Primera Fuente**: Tomar el primer resultado sin verificar
3. **Sin Fecha**: Ignorar cuándo fue publicado
4. **Sin Contexto**: Aplicar soluciones sin entender el problema
5. **Fuentes Únicas**: Depender de una sola fuente

## Checklist de Calidad

- [ ] Múltiples fuentes consultadas
- [ ] Fuentes verificadas como confiables
- [ ] Información actualizada (< 1-2 años)
- [ ] Consistencia entre fuentes
- [ ] Fuentes citadas claramente
- [ ] Información relevante al contexto
- [ ] Contradicciones identificadas y resueltas
