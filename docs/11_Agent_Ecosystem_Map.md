# Sovereign Grok Agent Suite — v1.0.1

# 11 — Agent Ecosystem Map

**Where SGAS and Grok Build sit. What sits beside them. What is not this suite.**  
**Version**: v1.0.1

SGAS is a **methodology suite**. It is not a harness, not a model, and not an always-on chat product. This page exists so that map is hard to miss.

---

## 1. The stack in one picture

```
Models / intelligence
  Grok (API + free tier) · Qwen · Ternary Bonsai 2 27B · DeepSeek · others
           │
Optional decision / routing layer
  Jev · Nimble · other cheap next-action routers
           │
Harness / runtime     ← this is the product layer
  Grok Build · OpenClaw · Hermes · DeepSeek dsh · Claude Code · Codex · …
           │
     ┌─────┴──────┐
     │            │
Managed cloud   Self-hosted / local-first
  Grok Bot        Your machine, VPS, or Start9 node
                       │
Methodology           ← this is SGAS
  How to run Grok Build under sovereignty,
  Zero Trust MCPs, hardware tiers, Plan Mode
```

**Agent = Model + Harness.**  
SGAS tells you how to operate one harness (Grok Build) without giving away the machine.

---

## 2. Parallel and perpendicular

**Parallel** means same layer, different product. You pick one as the default runtime.

**Perpendicular** means a different layer. It can sit on top of, under, or beside SGAS without replacing it.

| Thing | Layer | Relation to SGAS |
|--------|--------|------------------|
| **Grok models** (free / paid API) | Model | **Perpendicular.** Intelligence lever. Use for live search and hard reasoning. Not the methodology. |
| **Ternary Bonsai 2 27B** and other local weights | Model | **Perpendicular.** Entry-Tier local brain (see doc 04). |
| **Grok Build** | Harness | **The runtime this suite is written for.** Open source (Apache 2.0). Terminal / coding agent loop, Plan Mode, worktrees, MCP. |
| **Claude Code, Codex, OpenHands, Aider** | Harness | **Parallel.** Other coding/terminal harnesses. Ideas transfer; the docs assume Grok Build. |
| **OpenClaw, Hermes** | Harness | **Parallel.** Always-on personal agents (channels, presence, long memory). Different job from Grok Build. You can run both; SGAS does not replace them. |
| **DeepSeek dsh** | Harness | **Parallel.** Plugin-everything kit. Same layer as Grok Build, different architecture. |
| **Grok Bot** | Managed product | **Perpendicular and opposite pole.** Cloud computer, vendor-hosted, subscription-gated. Convenient. Not sovereign. Mention only as contrast. |
| **Jev / Nimble** | Decision layer | **Perpendicular.** Optional cheap router *inside* a harness loop. Compatible if you keep permissions tight. |
| **Start9 / Buzz** | Infrastructure | **Perpendicular.** Node / mesh substrate. See doc 10. |
| **SGAS** | Methodology | **This suite.** Operating principles for Grok Build: local-first, tiers, Zero Trust MCP, worktrees. |

If a reader asks “should I install SGAS instead of OpenClaw?” the answer is no. Install a harness. Read SGAS if that harness is Grok Build and you want it sovereign.

---

## 3. What we work with Grok on

Stay inside the Grok / xAI line when it buys something you cannot get cheaper locally:

- Grok Build as the **inspectable harness**
- Grok free/paid models as **search, current events, and hard reasoning**
- Grok 4.5 free tier as an Entry-Tier lever on weak hardware
- Plan Mode, worktrees, MCP, `AGENTS.md` as the **loop this suite standardizes**

Leave Grok (or never start there) when:

- The work is private files, keys, node data, or unpublished drafts
- The loop can run on a local model that already fits the machine (Bonsai 2 27B on 16 GB class, or smaller Ollama models)
- The product you want is an always-on messenger agent — that is OpenClaw/Hermes/Grok Bot territory, not this playbook

---

## 4. Two deployment poles

```
Managed                         Self-hosted
Grok Bot                        Grok Build on your disk
vendor computer                 your computer / Start9
presence + convenience          inspectable loop + your rules
                                ↑
                         SGAS lives here
```

Both can use Grok models. Only the right-hand pole is what this suite is for.

---

## 5. How to read this against the rest of the suite

1. Use **07** (and the 16 GB starter path) to begin.
2. Use **01 → 02 → 03 → 04 → 05** to build.
3. Use **this page** when another thread names OpenClaw, Hermes, dsh, Jev, or Grok Bot and you need to place them without rewriting the path.
4. Use **10** when the question is the machine or mesh under the harness, not the harness itself.

---

## Summary

SGAS does not compete with harnesses. It is the sovereignty manual for **Grok Build**. Other harnesses run in parallel. Models, routers, and infrastructure sit perpendicular. Grok Bot is the managed opposite.

Canonical hub: https://github.com/MoloBTC-Org/sgas
