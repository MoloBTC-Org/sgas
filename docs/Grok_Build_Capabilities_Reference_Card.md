# v0.1 Draft - Sovereign Grok Agent Suite

# Grok Build Capabilities Reference Card (v1)

**What You Can Actually Do with Grok Build**  
**June 24, 2026**

This card provides a clear, scannable overview of Grok Build’s current capabilities. It is designed as a quick reference for users (especially those in emerging markets or with constrained hardware) to understand what is possible today.

---

## 1. Terminal & System Management (Computer Manager Mode)

Grok Build functions as a capable **terminal/system agent**, not just a code generator.

**Key Capabilities**:
- Rearrange, move, and organize files and folders
- Remove broken applications and clean up leftover configs, caches, and PATH issues
- Install tools and manage system packages
- Run, debug, and fix terminal commands
- Automate repetitive setup and maintenance tasks
- Act as a “sysadmin assistant” or “butler in your terminal”

**Example Use Case**: Cleaning up a messy Hermes Agent installation before a fresh reinstall.

**Access**: Primarily through the Grok Build CLI (terminal).

---

## 2. Web Actions & Research (via Firecrawl Plugin)

Grok agents can now directly **search, scrape, crawl, map, extract, and interact** with any webpage from within the terminal.

**Key Capabilities**:
- Web search and crawling
- Page scraping and data extraction
- Website mapping
- Browser-based interactions (with OAuth login support on first use)
- No need to manually build wrappers or paste API keys

**Installation**: Available in the Grok Build Plugin Marketplace. Search for “firecrawl” and install.

**Free Tier**: 1,000 monthly credits.

**Access**: Grok Build CLI + Firecrawl plugin.

---

## 3. Autonomous & Goal-Oriented Workflows

The **`/goal`** command enables long-running, autonomous agentic tasks with multiple rounds of sub-agents.

**Key Capabilities**:
- Give Grok Build one high-level engineering objective
- Automatically creates an execution plan and breaks it into tasks
- Uses **sub-agents** to implement, review, and verify work across multiple rounds
- Tracks progress with a checklist
- Reviews code, inspects webpages, executes scripts
- Self-verifies output and recovers from failures
- Runs autonomously while you supervise (minimal micromanagement)

**Control Commands**:
- `/goal status`, `/goal pause`, `/goal resume`, `/goal clear`

**Paradigm Shift**: From “help me write code” → “own this engineering objective.”

**Access**: Grok Build CLI. Strong fit for Balanced and Top Tiers.

**Related Integration**: Hermes Agent can be powered by Grok Composer 2.5 (Claude Opus-level performance) via xAI Grok OAuth using an existing SuperGrok or X Premium+ subscription (no extra API key needed).

---

## Important Privacy & Sovereignty Consideration

**Grok Build’s Advanced Features Involve Cloud Data Uploads**

When using Grok Build’s most powerful agentic capabilities (especially `/goal`, deep multi-file context, and sub-agent workflows), the tool may automatically package and upload significant portions of your local repository — including git history — to Google Cloud Storage.

**What this means**:
- Your code, commit history, and potentially sensitive files can leave your machine.
- Secrets in `.env` files, config files, or git history may be exposed.
- You are transferring control of that data to xAI’s infrastructure (hosted on GCP).

**Recommendation by Tier**:
- **Entry Tier**: Use Grok Build primarily for lighter tasks. Prefer local models + self-hosted MCPs for anything sensitive.
- **Balanced Tier**: Use `/goal` and deep context features selectively. Maintain strict `.gitignore` rules and never run them on repositories containing secrets or proprietary code you cannot afford to expose.
- **Top Tier**: You have more flexibility, but the same risks apply. Consider running Grok Build inside isolated worktrees or containers when working with sensitive material.

**Mitigations**:
- Use `.gitignore` aggressively.
- Rotate any credentials that may have been exposed.
- Prefer local models and self-hosted MCP servers for high-sovereignty work.
- Review `~/.grok/logs/` regularly if you use advanced features.

This is a deliberate design tradeoff: greater agentic capability in exchange for reduced data sovereignty. Our suite emphasizes minimizing this tradeoff wherever possible.

**Update (July 2026)**: Grok Build has been fully open-sourced by xAI / SpaceXAI under the Apache 2.0 license (including the CLI and TUI). The source is publicly available for inspection, auditing, and community contribution. This improves transparency and allows users to verify data-handling behaviour. Usage limits were also reset at the time of open-sourcing. The underlying cloud upload behaviour for advanced agentic features remains a design trade-off that users should still manage carefully on sensitive repositories.

---

## 4. Model & Agent Integrations

Grok Build supports high-capability models and external agent frameworks.

**Key Capabilities**:
- Use **Composer 2.5** (xAI model with Claude Opus-level performance) inside Grok Build
- Integrate with **Hermes Agent** (Nous Research) using Grok OAuth (available at no extra cost with SuperGrok or X Premium+)
- Delegate tasks between Grok Build and other agents
- Access powerful models via simple OAuth instead of managing multiple API keys

**Access**: Grok Build + supported external agents (e.g., Hermes).

**Community Prompt Directories (Inspiration)**:  
Free open-source directories such as [botdirectory.ai](https://botdirectory.ai) provide hundreds of specialized Grok Bot prompts (Chief of Staff, research, ops, engineering coordination, etc.). These are excellent seed material for defining narrow local agents. Copy useful prompts into your own `AGENTS.md` or skill files and run them under Plan Mode + worktrees for full sovereignty and low cost.

---

## 5. Plugin Ecosystem

Grok Build has an official **Plugin Marketplace** that extends its capabilities.

**Current / Notable Plugins** (as of June 2026):
- **Firecrawl** — Web search, scraping, crawling, and data extraction
- MongoDB, Vercel, Sentry, Cloudflare, Chrome DevTools, and others
- Community contributions via PRs to the marketplace repository

**Installation**: Run `/plugin` inside Grok Build and search/install from the catalog.

**Access**: Grok Build CLI.

---

## 6. On-Device vs Cloud / Native vs Pushed Considerations

**Native / On-Device Strengths**:
- Full control over execution environment
- Better privacy for sensitive files and workflows
- Works offline or with limited connectivity after initial setup
- Lower long-term cost in weak-currency environments

**Pushed / Cloud Strengths** (via Grok subscription):
- Access to frontier-scale models (e.g., Grok 5 class)
- Strong real-time search and reasoning
- Lower hardware requirements on your local machine

**Recommended Approach (v1.1 Tiers)**:
- **Entry Tier**: Maximize local efficiency + use Grok strategically via apps/Build as a lever.
- **Balanced Tier**: Primary orchestration in Grok Build + strong local models for core work.
- **Top Tier**: Can lean more heavily on Grok cloud models while keeping sensitive actions local via MCPs and worktrees.

**Note on Voice/Dictation**: Grok Build is primarily text/terminal-based. However, if your device supports dictation or voice input, the practical difference from direct voice activation becomes minimal for many workflows.

---

## Quick Access Summary

| Capability                  | Primary Access          | Key Plugin / Feature          | Best For Tier          |
|----------------------------|-------------------------|-------------------------------|------------------------|
| Terminal / System Tasks    | Grok Build CLI         | Built-in                      | All tiers             |
| Web Search & Scraping      | Grok Build CLI         | Firecrawl plugin              | All tiers             |
| Autonomous Long Tasks      | Grok Build CLI         | `/goal` command               | Balanced & Top        |
| High-Performance Models    | Grok Build + Apps      | Composer 2.5 + OAuth          | Balanced & Top        |
| External Agent Integration | Grok Build + Hermes    | Hermes + Grok OAuth           | Balanced & Top        |
| Plugin Extensions          | Grok Build CLI         | Plugin Marketplace            | All tiers             |

---

**All core documents in this suite include Mermaid diagrams + ASCII fallbacks.**

This reference card is intended as a living document — new plugins and capabilities will be added as the Grok Build ecosystem evolves.

**File saved at**: `/home/workdir/artifacts/Grok_Build_Capabilities_Reference_Card.md`