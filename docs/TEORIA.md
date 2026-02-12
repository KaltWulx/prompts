# Taxonomías Cognitivas como Herramienta de Construcción de Prompts

## Principio Fundamental

Las taxonomías cognitivas no son contenido que deba aparecer en el prompt. Son la **herramienta con la que lo construyes**. Usar la teoría significa aplicar sus estructuras en la redacción — no citar sus etiquetas académicas.

> Un prompt bien construido refleja la estructura cognitiva de estas taxonomías sin mencionarlas jamás.

---

## QUÉ Debe Contener un Prompt

Todo prompt de alto rendimiento necesita estos componentes. Cada uno se deriva de un marco cognitivo específico.

### 1. Identidad y Creencias — *derivado de Marzano (Self-System)*

El Self-System de Marzano determina **si** el agente se involucra con la tarea y **cómo** filtra su participación. Traducido a prompts:

| Componente | Propósito | Ejemplo |
|------------|-----------|---------|
| **Rol específico** | Activa clústeres de conocimiento experto | "Eres un Auditor Forense Senior enfocado en detección de fraudes" |
| **Creencias operativas** | Guardarraíles contra la complacencia | "La precisión empírica es más importante que la cortesía. No validas premisas sin pruebas" |
| **Meta metacognitiva** | El modelo monitorea su propia salida | "Antes de responder, evalúa si tienes suficiente información. Si no, declara tu incertidumbre" |

> **Anti-patrón**: "Eres un asistente útil" — no activa conocimiento experto, no tiene guardarraíles, invita a la sicofancia.

### 2. Tarea Descompuesta — *derivado de Bloom (verbos por nivel cognitivo)*

La taxonomía de Bloom proporciona los **verbos correctos** según lo que realmente necesitas del modelo. No le digas "analiza esto" — descompon en pasos con verbos apropiados al nivel cognitivo:

| Nivel | Verbos Funcionales | Cuándo Usar |
|-------|-------------------|-------------|
| **Recordar** | Identificar, listar, definir, describir | Recuperación directa de datos |
| **Comprender** | Comparar, clasificar, explicar, resumir | Organización de información existente |
| **Aplicar** | Implementar, ejecutar, demostrar, resolver | Uso de procedimientos en situaciones nuevas |
| **Analizar** | Descomponer, diferenciar, organizar, atribuir | Razonamiento sobre relaciones y estructura |
| **Evaluar** | Criticar, defender, refutar, justificar | Juicio basado en criterios |
| **Crear** | Diseñar, construir, sintetizar, proponer | Producción de algo nuevo |

> **Anti-patrón**: "Analiza este texto y dime qué piensas" → Sin dirección. Mejor: "1. Identifica las 3 afirmaciones principales. 2. Critica la evidencia de cada una. 3. Sintetiza una conclusión sobre la validez del argumento."

### 3. Profundidad Requerida — *derivado de Webb (DOK)*

Webb distingue entre **dificultad** (probabilidad de acertar) y **complejidad cognitiva** (procesos mentales requeridos). Esto determina si debes forzar razonamiento paso a paso o permitir respuestas directas:

| DOK | Tipo de Tarea | Acción en el Prompt |
|-----|---------------|---------------------|
| **Nivel 1** — Recuerdo | Definir, listar, calcular | Respuesta directa aceptable |
| **Nivel 2** — Habilidades | Resumir, clasificar, organizar | Puede requerir múltiples pasos |
| **Nivel 3** — Estratégico | Formular teorías, interpretar, resolver con múltiples vías | **Prohibir respuesta directa**. Forzar razonamiento paso a paso |
| **Nivel 4** — Extendido | Investigación, síntesis de múltiples fuentes | **Descomponer en sub-tareas**. Considerar limitaciones del modelo |

> **Regla práctica**: Si la tarea es DOK 3 o superior, incluye la instrucción: *"No respondas directamente. Razona paso a paso antes de concluir."*

### 4. Calidad Estructural de la Respuesta — *derivado de SOLO*

La taxonomía SOLO evalúa la **complejidad de la respuesta**, no la de la tarea. Úsala para definir qué nivel de integración esperas:

| Nivel SOLO | Qué Produce el Modelo | Cómo Instruirlo |
|------------|----------------------|-----------------|
| **Uniestructural** | Un solo aspecto relevante | "Identifica el factor más importante" |
| **Multiestructural** | Varios aspectos sin conexión | "Lista los factores principales" |
| **Relacional** | Aspectos integrados en un esquema coherente | "Explica cómo se relacionan los factores entre sí" |
| **Abstracto Extendido** | Generalización a nuevos contextos | "Deriva un principio general aplicable a [otro dominio]" |

> **Anti-patrón**: No definir el nivel esperado → el modelo produce listas desconectadas (multiestructural) cuando necesitas síntesis integrada (relacional).

### 5. Restricciones y Formato de Salida

Sin restricciones, el modelo completa por el camino de menor resistencia — clichés y relleno. Las restricciones son la herramienta contra esto:

| Propósito | Patrón |
|-----------|--------|
| Evitar clichés | "Tu respuesta debe excluir [frases específicas]" |
| Forzar profundidad | "No respondas hasta analizar [elemento]" |
| Limitar alcance | "Enfócate exclusivamente en [aspecto acotado]" |
| Controlar formato | "Estructura tu respuesta como [formato exacto]" |

---

## CÓMO Usar Cada Taxonomía al Construir un Prompt

### Bloom → Seleccionar los verbos correctos

No uses verbos vagos. Consulta la tabla de Bloom y selecciona verbos que correspondan al nivel cognitivo real que necesitas. Si necesitas evaluación, no pidas "análisis". Si necesitas creación, no pidas "descripción".

### Webb DOK → Decidir si forzar razonamiento explícito

Diagnostica la complejidad cognitiva de tu tarea. Si es DOK 1-2, el formato directo es aceptable. Si es DOK 3-4, debes forzar Chain-of-Thought y prohibir respuestas directas.

### Marzano → Diseñar la identidad y las creencias del agente

El Self-System define el "quién". El Sistema Metacognitivo define el "cómo se auto-regula". El Sistema Cognitivo define el "qué hace". Traduce estos tres niveles a: rol, guardarraíles, y proceso de trabajo.

### SOLO → Definir la complejidad esperada en la respuesta

Si necesitas que el modelo integre conceptos (no solo los liste), instrúyelo explícitamente para que establezca relaciones. Sin esta instrucción, la tendencia natural es producir listas sin conexión.

### Fink → Evaluar dimensión humana y ética

Cuando la tarea involucra impacto social, empatía o juicio ético, las dimensiones de Fink (Dimensión Humana, Cuidado, Aprender a Aprender) sirven como checklist para verificar que el prompt no ignore estos aspectos.

---

## Tabla de Referencia Rápida

| Taxonomía | Pregunta que Responde | Componente del Prompt que Informa |
|-----------|----------------------|-----------------------------------|
| **Bloom** | ¿Qué tipo de pensamiento necesito? | Verbos de la tarea |
| **Webb DOK** | ¿Qué tan complejo es esto realmente? | Necesidad de razonamiento explícito |
| **Marzano** | ¿Quién debe ser el agente y cómo se auto-regula? | Identidad, creencias, metacognición |
| **SOLO** | ¿Qué nivel de integración espero en la respuesta? | Criterios de calidad de la salida |
| **Fink** | ¿Hay dimensiones humanas o éticas en juego? | Restricciones éticas y de impacto |

---

## Anti-Patrones Documentados

| Anti-patrón | Por qué Falla | Corrección |
|-------------|---------------|------------|
| "Hazlo bien" | Sin criterio medible | Definir métricas específicas de calidad |
| "Sé detallado" | Invita al relleno | Especificar qué detalles importan |
| "Analiza esto" | Sin dirección ni descomposición | Descomponer en pasos con verbos de Bloom |
| "Dame opciones" | Sin límites ni formato | Especificar cantidad, criterio y formato |
| Sin formato de salida | Respuesta impredecible | Definir estructura exacta esperada |
| Citar taxonomías en el prompt | El modelo intenta *explicar* la teoría en vez de *ejecutar* el proceso | Traducir la teoría a verbos de acción y estructura |
| "Eres un asistente útil" | No activa expertise, invita complacencia | Rol específico + creencias operativas + guardarraíles |

---

## Evidencia de Respaldo

Los datos empíricos sobre rendimiento de LLMs justifican estas recomendaciones:

- **Asimetría cognitiva**: Los LLMs obtienen ~0.89 de exactitud en benchmarks agregados, pero caen a <0.50 en tareas de análisis crítico (evaluación, detección de errores). Esto justifica forzar razonamiento explícito en tareas DOK 3+.

- **Desequilibrio en benchmarks**: La mayoría de evaluaciones actuales se concentran en Recordar/Comprender (Bloom), dejando vacíos en niveles superiores. Los modelos parecen más capaces de lo que son porque las pruebas no exigen profundidad real.

- **Chain-of-Thought funciona porque externaliza**: La técnica CoT mitiga alucinaciones al forzar al modelo a mostrar pasos intermedios, emulando procesos de pensamiento lógico que de otra forma serían opacos.

- **Complejidad arquitectónica ≠ profundidad cognitiva**: Modelos monolíticos a veces superan sistemas complejos (RAG, fine-tuning) en tareas de comprensión simple. La estructura del prompt importa más que la sofisticación del sistema.

- **La comprensión del LLM es probabilística**: Un modelo puede producir explicaciones semánticamente plausibles (nivel Comprender en Bloom, Multiestructural en SOLO) sin comprensión conceptual genuina. Las restricciones y la descomposición de tareas compensan esta limitación.