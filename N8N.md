# n8n - AI Agent Framework

**Last Updated**: 2026-01-30

## Overview

n8n is a workflow automation platform with comprehensive AI agent capabilities. It enables building autonomous systems that receive data, make decisions, and act to achieve goals through a visual workflow editor or code.

**Key Features**:
- Visual workflow builder with AI Agent nodes
- LangChain integration via cluster nodes architecture
- Multi-agent collaboration patterns
- MCP (Model Context Protocol) support
- RAG (Retrieval-Augmented Generation) capabilities
- 5000+ workflow templates

---

## 1. AI Agent Node (The Core!)

The **AI Agent node** is the heart of building agents in n8n. It's an autonomous system that receives data, makes decisions, and acts to achieve goals.

**Key Points**:
- All AI Agent nodes now work as **Tools Agent** (since v1.82.0)
- Must connect at least **one tool sub-node** to function
- Can understand tool capabilities and determine which to use

| Feature | LLM | AI Agent |
|---------|-----|----------|
| Core Capability | Text generation | Goal-oriented task completion |
| Decision-Making | None | Yes |
| Uses Tools/APIs | No | Yes |
| Workflow Complexity | Single-step | Multi-step |

📚 **Documentation**: [AI Agent Node](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.agent/)

---

## 2. LangChain Integration (Cluster Nodes Architecture)

n8n uses **Cluster Nodes** - node groups that work together. A **root node** + one or more **sub-nodes** extend functionality.

### Root Nodes (Chains & Agents)

| Node Type | Purpose |
|-----------|---------|
| **AI Agent** | Autonomous decision-making with tools |
| **Basic LLM Chain** | Series of LLMs linked together |
| **Retrieval Q&A Chain** | Question answering with retrieval |
| **Summarization Chain** | Text summarization |
| **Sentiment Analysis** | Analyze sentiment |
| **Text Classifier** | Classify text |
| **LangChain Code** | Custom LangChain functionality |

📚 **Documentation**: [LangChain Concepts in n8n](https://docs.n8n.io/advanced-ai/langchain/langchain-n8n/)

---

## 3. Sub-Nodes (The Arsenal!)

### Language Models (LLMs)

- Anthropic Chat Model
- AWS Bedrock Chat Model
- Cohere Model
- Hugging Face Inference Model
- Mistral Cloud Chat Model
- Ollama Chat Model / Ollama Model
- OpenAI Chat Model

### Memory Nodes

| Node | Description |
|------|-------------|
| **Simple Memory** | In-memory buffer (configurable window) |
| **Redis Chat Memory** | Persistent Redis storage |
| **Postgres Chat Memory** | PostgreSQL storage |
| **Motorhead** | Motorhead memory server |
| **Xata** | Xata database memory |
| **Zep** | Zep memory server |

### Tool Nodes

| Tool | Purpose |
|------|---------|
| **Calculator** | Math operations |
| **Code Tool** | Custom code execution |
| **SerpAPI** | Search engine results |
| **Think Tool** | Agent reasoning |
| **Vector Store Tool** | Query vector stores |
| **Wikipedia** | Wikipedia lookups |
| **Wolfram\|Alpha** | Computational queries |
| **Workflow Tool** | Call other n8n workflows |
| **HTTP Request Tool** | Connect to any API |

### Vector Stores

- Simple Vector Store (in-memory)
- PGVector Vector Store
- Pinecone Vector Store
- Qdrant Vector Store
- Supabase Vector Store
- Zep Vector Store

### Embeddings

- Embeddings AWS Bedrock
- Embeddings Cohere
- Embeddings Google PaLM
- Embeddings Hugging Face Inference
- Embeddings Mistral Cloud
- Embeddings Ollama
- Embeddings OpenAI

### Output Parsers

- Auto-fixing Output Parser
- Item List Output Parser
- Structured Output Parser

### Text Splitters

- Character Text Splitter
- Recursive Character Text Splitter
- Token Splitter

---

## 4. Agentic Workflow Patterns

n8n supports **four key design patterns** for AI agentic workflows:

### Pattern 1: Chained Requests

Series of predefined commands to various models in sequence.

- Rigid logic, flexible components
- Each step refined independently
- Ideal for multi-modal content creation

**Use Case**: Content pipeline with text generation, image creation, and formatting in sequence

### Pattern 2: Single Agent

One AI agent maintains state and makes all decisions.

- Can query various tools as needed
- Simpler to implement and debug
- Maintains context across interactions

**Use Case**: Customer support bot that can access knowledge base, CRM, and ticketing system

### Pattern 3: Multi-Agent with Gatekeeper

Primary agent delegates to specialized subordinate agents.

- Centralized control with distributed expertise
- Can use smaller fine-tuned LLMs for specialized tasks
- Scalable architecture

**Use Case**: Enterprise assistant where main agent routes requests to specialized agents (HR, IT, Finance)

### Pattern 4: Multi-Agent Teams

Several AI agents collaborate on sophisticated tasks.

- Mesh network, hierarchical tree, or hybrid structures
- Distributed decision-making
- Most complex and flexible

**Use Case**: Software development team with agents for requirements analysis, coding, testing, and documentation

📚 **Documentation**: [AI Agentic Workflows Guide](https://blog.n8n.io/ai-agentic-workflows/)

---

## 5. MCP Integration (Model Context Protocol)

Connect n8n to external tools via MCP using the **community node**.

**Installation**:
```bash
# Install via n8n community nodes
# Set environment variable:
N8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true
```

**Connection Types**:

| Type | Status |
|------|--------|
| **HTTP Streamable** | ✅ Recommended |
| **STDIO (Command-line)** | ✅ Supported |
| **SSE** | ⚠️ Deprecated (legacy) |

**Operations**:
- Execute Tool
- List Tools
- List Resources
- Get Prompt
- List Prompts
- Read Resource

**Example Docker Setup**:
```yaml
services:
  n8n:
    image: n8nio/n8n
    environment:
      - MCP_BRAVE_API_KEY=your-api-key
      - MCP_OPENAI_API_KEY=your-openai-key
      - N8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true
```

📚 **Documentation**: 
- [n8n-nodes-mcp GitHub](https://github.com/nerding-io/n8n-nodes-mcp)
- [MCP Integrations Page](https://n8n.io/integrations/categories/ai/model-context-protocol/)

---

## 6. RAG (Retrieval-Augmented Generation)

Build RAG systems by combining vector stores with AI agents:

1. **Ingest documents** → Document loaders
2. **Split text** → Text splitters
3. **Create embeddings** → Embedding nodes
4. **Store vectors** → Vector store nodes
5. **Query with agent** → AI Agent + Vector Store Tool

**Example Workflow**:
```
Document Loader → Text Splitter → Embeddings → Vector Store
                                                      ↓
User Query → AI Agent → Vector Store Tool → Generate Response
```

📚 **Documentation**: [RAG in n8n](https://docs.n8n.io/advanced-ai/rag-in-n8n/)

---

## 7. Tutorials & Templates

| Resource | Link |
|----------|------|
| **Intro Tutorial** | [Build an AI workflow](https://docs.n8n.io/advanced-ai/intro-tutorial/) |
| **First AI Agent Template** | [Build your first AI agent](https://n8n.io/workflows/6270-build-your-first-ai-agent/) |
| **AI Workflow Templates** | [5000+ AI templates](https://n8n.io/workflows/categories/ai/) |
| **Video Courses** | [n8n Video Courses](https://docs.n8n.io/video-courses/) |
| **Learning Path** | [n8n Learning Path](https://docs.n8n.io/learning-path/) |

---

## 8. Best Practices

### Workflow Design

- **Start Simple**: Begin with Single Agent pattern, add complexity as needed
- **Modular Tools**: Create reusable tool sub-nodes
- **Error Handling**: Add error handlers for robust workflows
- **Testing**: Use n8n's built-in testing features

### Agent Configuration

- **Clear Instructions**: Provide specific, actionable prompts
- **Tool Selection**: Only connect relevant tools to reduce confusion
- **Memory Management**: Choose appropriate memory type for use case
- **Model Selection**: Balance cost, speed, and capability

### Performance

- **Parallel Execution**: Use n8n's parallel branches for independent tasks
- **Caching**: Implement caching for frequently accessed data
- **Monitoring**: Track agent performance and costs
- **Version Control**: Use n8n's version control features

### Security

- **Credential Management**: Use n8n's credential system
- **API Rate Limiting**: Implement rate limiting for external APIs
- **Data Privacy**: Be mindful of sensitive data in prompts
- **Access Control**: Use n8n's role-based access control

---

## 9. Comparison with Other Frameworks

| Aspect | n8n | GitHub Copilot | Cursor |
|--------|-----|----------------|--------|
| **Interface** | Visual workflow + Code | IDE extension | IDE application |
| **Agent Type** | Autonomous workflows | Code assistants | Code assistants |
| **Deployment** | Self-hosted or Cloud | GitHub-hosted | Desktop app |
| **LLM Support** | Multiple providers | GitHub's models | Multiple providers |
| **Tools** | 400+ integrations | File/Git/Web | File/Terminal/Web |
| **Multi-Agent** | Native support | Single agent | Subagents |
| **Memory** | Multiple options | Session-based | Session-based |
| **Use Case** | Workflow automation | Code generation | Code generation |

---

## Quick Reference Links

| Resource | URL |
|----------|-----|
| Main Docs | [docs.n8n.io](https://docs.n8n.io/) |
| AI Agent Node | [AI Agent Docs](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.agent/) |
| LangChain in n8n | [LangChain Docs](https://docs.n8n.io/advanced-ai/langchain/langchain-n8n/) |
| Advanced AI | [Advanced AI Docs](https://docs.n8n.io/advanced-ai/) |
| Agentic Workflows Blog | [AI Agentic Workflows](https://blog.n8n.io/ai-agentic-workflows/) |
| AI Agents Explained | [AI Agents Blog](https://blog.n8n.io/ai-agents/) |
| GitHub Repo | [n8n-io/n8n](https://github.com/n8n-io/n8n) |
| MCP Node | [n8n-nodes-mcp](https://github.com/nerding-io/n8n-nodes-mcp) |

---

## Getting Started

### Installation

**Self-Hosted (Docker)**:
```bash
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8nio/n8n
```

**Cloud**: Sign up at [n8n.cloud](https://n8n.cloud)

**npm**:
```bash
npm install n8n -g
n8n start
```

### Your First AI Agent

1. Create a new workflow
2. Add an **AI Agent** node
3. Connect an **LLM** sub-node (e.g., OpenAI Chat Model)
4. Add at least one **Tool** sub-node (e.g., Calculator)
5. Configure the agent with instructions
6. Test and iterate

📚 **Follow the Tutorial**: [Build an AI workflow](https://docs.n8n.io/advanced-ai/intro-tutorial/)

---

**Repository**: swarm-protocol/github
