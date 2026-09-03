# Sovereign Grok Agent Suite — v1.0.0

# Building AI Agents Natively with Grok Build in Maximum Security (Local-First) Mode
**A Practical Guide Aligned with Iterative Planning Processes**  
**June 15, 2026**  
**Context**: Inspired by the X post from @0xwhrrari promoting the full AI agent stack (agents, Codex/Code, prompts, memory, skills, MCP, routines, subagents, structured outputs). This maps directly to Grok Build’s native capabilities while prioritizing **maximum security** (local LLM + self-hosted stdio MCPs + worktree isolation + Plan Mode + strict AGENTS.md).  

Excludes trading-specific strategies. Focused on sovereignty, structured workflows, publishing/research agents, and your broader interests (Bitcoin/node ops, multi-body docs/Codex, open-source/hardware).

---

## 1. Deep Dive on the X Post (@0xwhrrari)

The post quotes a clip of Google’s former CEO (Eric Schmidt) emphasizing that building wealth in the AI era comes from **actually learning and using the tools** — not just consuming threads. It lists a comprehensive, free stack of OpenAI/Codex resources covering:

- Basics: ChatGPT, prompt engineering, structured outputs, memory, Projects, Custom GPTs, Tasks.
- Advanced agentic: Responses API, Agents SDK + quickstart, Tools/function calling, Conversation state.
- Codex-specific: Overview, CLI, GitHub repo, best practices, **AGENTS.md**, skills, **MCP**, subagents.
- Extras: Apps SDK, developer mode + MCP, OpenAI Cookbook.

**Key message**: Move from one-shot prompting to systems built on agents + memory + skills + MCP + routines. “Most people will keep asking AI one question at a time.”

**Video**: Likely an older Schmidt clip repurposed to highlight the shift to agentic workflows.

**Relevance to our iterative planning process**:
- Strongly aligns with **Grok Build’s Plan Mode** (structured planning + diffs + approval loops).
- **Worktrees** enable safe, parallel iteration on agent components without polluting main projects (perfect for “routines” and testing subagents/skills).
- **MCP** is explicitly called out — Grok Build has native support.
- **AGENTS.md** and skills mirror gstack-style structured workflows but are native and more flexible in Grok Build.
- Emphasis on **memory** and **subagents** matches our discussions.
- The post promotes learning the full stack to compound productivity — exactly what iterative Plan Mode + worktree experimentation delivers.

This is “more of the same” in the best way: practical, stack-focused, anti-hype guidance that fits perfectly with Grok Build’s local-first, auditable design.

---

## 2. Maximum Security Mode in Grok Build (Local-First Configuration)

**Definition of “Max Security” here**:
- **Reasoning stays local** (Ollama or compatible local LLM — no xAI API for core agent loops).
- **Tools via self-hosted stdio MCPs** only (credentials and logic never leave your machine unless you explicitly choose remote).
- **Isolation via Git worktrees** (`grok -w` or home screen) for every experiment/iteration.
- **Strict human oversight** via Plan Mode + AGENTS.md rules.
- **Minimal external surface**: Read-only MCPs preferred; write actions gated; no unnecessary cloud calls.
- **Auditability**: Every change via diffs in worktrees; full local logs/history.

**One-time setup** (run these commands):

```bash
# 1. Install Grok Build (if not already)
curl -fsSL https://x.ai/cli/install.sh | bash

# 2. Install local LLM backend (Ollama recommended)
# Follow https://ollama.com (or use LM Studio / llama.cpp)
ollama serve
ollama pull qwen2.5-coder:14b   # or gemma3:12b, llama3.1:8b etc. — choose based on your hardware

# Strong recommendation for agentic/coding work: GLM-5.2 (or its FP8 quantized version)
# from Z.ai (MIT open weights, excellent long-horizon agentic performance, 1M context)
# Note: Full precision requires significant hardware; quantization makes it more accessible.
# See https://huggingface.co/zai-org/GLM-5.2 for weights and deployment guides (vLLM, SGLang, etc.)

# 3. Configure Grok Build for local-only reasoning
mkdir -p ~/.grok
cat > ~/.grok/config.toml << 'EOF'
[model]
provider = "ollama"
name = "qwen2.5-coder:14b"   # or your preferred local model
temperature = 0.6
max_tokens = 8192
context_length = 32768

[security]
local_only = true
prefer_stdio_mcp = true
worktree_isolation = true
EOF

# 4. (Optional but recommended) Create a dedicated projects folder with worktree support
mkdir -p ~/grok-agents
cd ~/grok-agents
git init   # optional but useful for worktree tracking
```

**Recommended Local Model for Agentic Work**:

As of June 2026, **GLM-5.2** (from Z.ai, MIT-licensed open weights) stands out as one of the strongest options for the local "brain" in sovereign setups. It shows particularly strong performance in **coding and long-horizon agentic tasks**, with a usable 1M context window. This makes it an excellent fit for the complex, multi-step workflows we build with Plan Mode and sub-agents.

- Full model is large (753B MoE); use the FP8 quantized version on Hugging Face for more practical hardware requirements.
- Deployment: Supports vLLM, SGLang, transformers, etc.
- API is also available at competitive pricing as a bridge while setting up local serving.

Update your `config.toml` `name` field accordingly (via Ollama or direct inference engine integration).

**Self-hosted MCP example** (for tools — save as `mcp_server.py` and run with `python mcp_server.py`):

```python
from fastmcp import FastMCP
import os, json

mcp = FastMCP(name="secure-local-tools", host="127.0.0.1", port=5001)

@mcp.tool()
def read_local_file(path: str) -> str:
    """Read-only file access (example — expand as needed)"""
    with open(path, "r") as f:
        return f.read()

@mcp.tool()
def write_local_file(path: str, content: str) -> str:
    """Write with explicit approval only (use in Plan Mode)"""
    with open(path, "w") as f:
        f.write(content)
    return f"Written to {path}"

if __name__ == "__main__":
    mcp.run()
```

Run it locally and register via MCP config or let Grok Build discover it.

---

## 3. The Iterative Planning Process with Grok Build (Core Workflow)

This is our “planning process driven approach” made native and maximally secure.

### Phase 0: Project Setup (One-time per major project)
```bash
cd ~/grok-agents/your-project
git init
grok          # starts the TUI
# Create AGENTS.md immediately
```

**AGENTS.md template** (strict security & planning rules — customize per project):

```markdown
# AGENTS.md — Maximum Security Rules for [Project Name]

## Core Principles
- Always start in Plan Mode.
- Use dedicated worktree for every major change or experiment (`grok -w` or home screen).
- Prefer read-only MCP tools. Any write action requires explicit approval.
- Local LLM only. No xAI API for reasoning loops.
- Keep scope narrow. One excellent narrow agent > universal agent.
- Memory: Start with short-term context + simple JSON/local files. Add advanced retrieval only when needed.
- Audit everything: Every output must be reviewable via diffs and logs.

## Workflow Rules
1. User gives goal → You enter Plan Mode automatically.
2. Research (local knowledge + approved MCP tools only).
3. Produce detailed plan with step-by-step diffs and risk assessment.
4. Wait for explicit user approval before any execution or file change.
5. Execute in isolated worktree.
6. After changes: Run /check against this AGENTS.md.
7. For iteration: Spawn new worktree, never modify main until approved.

## Memory & State
- Short-term: Last N messages in context.
- Persistent: Simple JSON files or local SQLite in project folder (self-managed).
- Never store sensitive data in prompts.

## Security
- All MCP calls via self-hosted stdio where possible.
- No external writes without approval.
- Log every tool call and decision locally.
```

### Phase 1: Define a Small, Specific Problem (Iterative Planning Start)
Use the spirit of the Reddit guide + the post’s stack:

**Example prompt to Grok Build** (paste in TUI):

```
You are in Plan Mode. 

Goal: Build a narrow research-to-structured-notes agent for my Codex / multi-body documents.

Constraints (from AGENTS.md):
- Local LLM only
- Self-hosted read-only MCP tools preferred
- Worktree isolation for all experimentation
- Start with minimal memory (short-term + simple JSON)

Deliver:
1. A clear one-sentence problem statement
2. Recommended narrow scope (what it does NOT do)
3. High-level architecture (model loop + tools + memory)
4. Step-by-step plan with diffs for initial skeleton
5. Risk assessment and mitigation
6. Suggested first worktree name and next command

Do not execute anything yet.
```

Grok Build (in Plan Mode) will produce exactly the structured plan you need.

### Phase 2: Build the Skeleton (Model → Tool → Result Loop)
Using Grok Build’s native features:

- **Input**: User goal or file.
- **Model**: Local LLM via your config + AGENTS.md instructions.
- **Tools**: Self-hosted MCP (file ops, web search via approved local proxy if needed, etc.).
- **Loop**: Model decides → calls MCP tool → result fed back → continues until done.
- **Memory**: Start simple (conversation history + project JSON file). Expand later.
- **Subagents**: Spawn parallel ones in separate worktrees for research vs. structuring vs. review.
- **Structured outputs**: Use AGENTS.md to enforce JSON or specific formats when needed.

**Example first command after plan approval** (in a new worktree):

```bash
grok -w research-agent-v1
# Then in TUI:
Build the initial skeleton for the research agent following the approved plan. Use only approved MCP tools. Create the first working loop.
```

### Phase 3: Add Memory, Skills & Routines Incrementally
- **Memory**: Start with short-term context. Add a simple local JSON or SQLite via MCP when needed. (Compare to gbrain — you can build similar with local tools.)
- **Skills / Routines**: Encode recurring patterns in AGENTS.md or custom slash commands/skills (e.g., `/research-phase`, `/structure-phase`).
- **Subagents**: Use Grok Build’s native sub-agent support in worktrees for parallel phases (research subagent + structuring subagent + review subagent).
- **MCP**: Register your self-hosted tools. Expand with more read-only connectors as needed.

**Specialized Multi-Agent Pattern (Local)**  
You can achieve the same specialized multi-agent feel shown in free community directories (e.g. botdirectory.ai) without expensive cloud platforms:

1. Define a **Coordinator / Chief of Staff** persona in `AGENTS.md`.
2. Define 2–4 narrow specialist personas (Research, Coding, Review, Ops).
3. Seed the specialist prompts from free open directories or write your own.
4. Run each specialist in its own worktree under Plan Mode.
5. Keep the Coordinator as the single point of contact that maintains a simple local status file of what is in flight.

This pattern stays fully under your control, works on constrained hardware, and preserves sovereignty.

### Phase 4: Iterate Safely with Worktrees
This is the killer feature that makes Grok Build superior for iterative work:

- Every major change or experiment → new worktree.
- Test, break, fix in isolation.
- Merge only approved changes back to main.
- Discard bad branches instantly.

This directly supports the “iterate in small cycles” advice from the guides while keeping everything auditable and secure.

### Phase 5: Wrap & Use
- Start with CLI (Grok Build TUI is already excellent).
- Later add simple local interface if desired (FastAPI wrapper calling `grok` headless with `-p`).
- For scheduled routines: Use external cron + headless Grok Build calls (still local).

---

## 4. Recommended First Agents (Narrow & High-Value)

Following the “start small” principle from the post and Reddit guide:

1. **Research-to-Structured-Notes Agent** (for Codex / textbook sections)
2. **File/Folder Processor** (summarize PDFs, extract action items — via self-hosted MCP)
3. **Meeting / Research Debrief Agent** (clean notes → decisions + action items)
4. **Daily / Weekly Briefing Agent** (local files + approved tools only)
5. **Code / Doc Review Agent** (with strict AGENTS.md rules)

Build one end-to-end using the phases above. The skill compounds.

---

## 5. Security Best Practices Summary (Max Mode Checklist)

- [ ] Local LLM configured and verified (`ollama list` + config.toml)
- [ ] All MCPs self-hosted stdio where possible
- [ ] Worktrees used for every iteration/experiment
- [ ] Plan Mode mandatory for all changes
- [ ] AGENTS.md strict and reviewed regularly
- [ ] Memory starts minimal (short-term + simple local files)
- [ ] Read-only tools preferred; writes require explicit approval + worktree
- [ ] No unnecessary external API calls for reasoning
- [ ] Full local logging and audit trail
- [ ] Scope kept narrow — one excellent agent at a time

---

## 6. How This Compares to the Post’s Stack

| Concept in Post          | Grok Build Native Equivalent (Max Security)          | Security Advantage                  |
|--------------------------|-----------------------------------------------------|-------------------------------------|
| Agents / Subagents       | Plan Mode + native sub-agents in worktrees          | Full isolation via worktrees        |
| Prompts / Structured outputs | AGENTS.md + system prompts + local model           | Local only                          |
| Memory                   | Short-term context + local JSON/SQLite via MCP      | No cloud, user-controlled           |
| Skills / Routines        | AGENTS.md rules + custom skills/slash commands      | Local, auditable                    |
| MCP / Tools              | Native MCP support — self-hosted stdio preferred    | Credentials never leave machine     |
| Codex CLI / Workflows    | Grok Build CLI + worktrees + Plan Mode              | Local-first + safe iteration        |
| Iteration & Refinement   | Worktrees + /check + small cycles                   | Disposable branches, full audit     |

Grok Build gives you the full stack **natively** with stronger built-in security and iteration safety than most cloud-heavy approaches.

---

## Security Considerations for Cloud-Dependent Features

Grok Build’s most advanced agentic features (particularly `/goal` and deep shared context across sub-agents) rely on uploading substantial portions of your local repository — including git history — to Google Cloud Storage. This is done to provide the remote model with rich context.

While powerful, this behavior has direct implications for both **privacy** and **sovereignty**:

### Key Risks
- **Data Exfiltration**: Large parts of your codebase and development history leave your machine.
- **Secret Exposure**: Files containing API keys, credentials, or configuration can be included in uploads.
- **Loss of Control**: Once uploaded, your data is subject to xAI’s infrastructure, policies, and potential legal requests.
- **Intellectual Property Leakage**: Proprietary logic, algorithms, and historical development decisions become accessible to a third party.

### Recommended Practices

**When using `/goal` or deep context features**:
- Never run them on repositories containing secrets or highly sensitive code without strong mitigations.
- Maintain a strict and up-to-date `.gitignore`.
- Consider running Grok Build inside a dedicated worktree or container to limit blast radius.
- Regularly inspect `~/.grok/logs/unified.json` for upload activity.

**Tier-Based Guidance**:
- **Entry Tier**: Avoid or minimize use of heavy cloud-dependent features. Rely primarily on local models and self-hosted MCPs.
- **Balanced Tier**: Use these features selectively and only on non-sensitive codebases. Combine with strong local tooling.
- **Top Tier**: You may use them more freely, but still apply the same hygiene and isolation practices for any sensitive work.

**Strongly Recommended Pattern**:
For maximum sovereignty, treat Grok Build’s cloud features as a **high-privilege tool** rather than the default. Use local models + authenticated self-hosted MCP servers for core agent logic and sensitive operations, and reserve Grok Build’s most powerful cloud capabilities for non-sensitive scaffolding, exploration, or acceleration tasks.

This approach preserves the benefits of Grok Build while aligning with the sovereignty and Zero Trust principles outlined throughout this guide.

**Update (July 2026)**: Grok Build itself has been open-sourced by xAI / SpaceXAI (Apache 2.0). The full source code of the agent harness and CLI is now publicly available for review and contribution. This is a material improvement in transparency and auditability. Users can now inspect the exact behaviour of the tool, including any data-handling paths. The open-sourcing followed community feedback on repository upload practices. The privacy and sovereignty recommendations in this section remain fully applicable.

---

## Truth & Clarity Summary

The X post is excellent practical curation of the modern agent stack and aligns closely with Grok Build’s strengths (especially Plan Mode for iterative planning, worktrees for safe parallelism, MCP for tools, and AGENTS.md for structure). The quoted resources are mostly OpenAI/Codex-focused; Grok Build offers a more local-first, sovereign alternative with native equivalents that are often more powerful for security-conscious users.

This document gives you a complete, ready-to-use framework for building agents **natively in Grok Build at maximum security**. It directly incorporates the iterative planning process you already use, the small-scope advice from recent guides, and the stack concepts from the post — all while keeping reasoning, tools, memory, and iteration fully under your control on your machine.

Start with one narrow agent using the phases above. The compounding effect is real.

**Next step recommendation**: Pick one small problem from your existing plan, spin up a worktree, create the AGENTS.md, and run the first Plan Mode session today. You’ll have a working skeleton faster than you expect.

Canonical path: `docs/` in https://github.com/MoloBTC-Org/sgas

Let me know if you want expansions on any section, example AGENTS.md for a specific workflow, or MCP server templates tailored to your needs. Ready to iterate on this document itself using the same secure process. 🚀