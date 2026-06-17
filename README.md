# Otic Studio

**Offline AI-Powered Learning Operating System**

[![Release](https://img.shields.io/badge/release-v1.1.0-4F46E5)](https://github.com/malinzijeremiah01-lab/Otic-Studio/releases/latest)
[![Platform](https://img.shields.io/badge/platform-Android%20%7C%20Windows-informational)](#downloads)
[![Offline](https://img.shields.io/badge/network-100%25%20offline-10B981)](#core-constraint-offline-first)
[![Built with Flutter](https://img.shields.io/badge/built%20with-Flutter-02569B)](https://flutter.dev)

> **Maintainers / new team:** start with **[HANDOVER.md](HANDOVER.md)** — it lists everything needed to build, change, release, and maintain the app, including the signing keystore and AI model that are not in the repo.

Otic Studio is a fully offline AI tutor and learning platform for students in schools with no reliable internet. Every feature — AI responses, curriculum generation, exercises, certificates, badges, even a website builder — runs entirely on-device. **No internet, no cloud, no external APIs, no accounts. Ever.**

The AI model (Gemma 3 1B) is bundled and runs locally: LiteRT-LM on Android, llama.cpp on desktop. Updates ship by USB drive or local school LAN, never the internet.

---

## Downloads

Get the latest build from the [**Releases page**](https://github.com/malinzijeremiah01-lab/Otic-Studio/releases/latest). Each release provides both:

| Download | Platform | How to install |
|---|---|---|
| `otic-studio-vX.Y.Z.apk` | **Android phones/tablets** (4 GB RAM) | Copy to the device, open it, allow "Install unknown apps" |
| `otic-studio-windows-vX.Y.Z.zip` | **Windows desktop** (8 GB RAM) | Extract anywhere, run `Otic Studio.exe` |

Both can also be shared offline by USB, Bluetooth, or a local server. The APK is signed with the official Otic Studio certificate (`CN=Otic Studio, O=OTIC, L=Kampala, C=UG`); Android rejects updates not signed with the same key.

### The AI model (one extra step, once per device)

The app is small; the AI tutor needs the **Gemma 3 1B model file (~1 GB)**, distributed separately on USB or a school server — never over the internet. The app runs without it and shows a **"Model Not Installed"** screen with an **Install from file…** button: pick the model from wherever you copied it and the app validates, copies, and activates it with a progress bar.

---

## Features

| Area | What it does |
|---|---|
| **Learn** | Ask anything; the AI mentors through Answer → Clarify → Practice → Apply → Create → Reflect |
| **Practice** | AI-generated multiple-choice exercises with feedback and scoring |
| **Apply** | Real-world scenario challenges with open-ended AI evaluation |
| **Create** | Build projects (essay, business plan, experiment, story, code plan) guided step by step |
| **Teach** | Explain a topic back to OTIC and get a mastery score |
| **Website Builder** 🆕 | Drag-and-drop page builder; AI writes block content; exports a standalone offline `.html` file |
| **Learning Paths** | AI generates a multi-unit curriculum for any topic, with lesson tracking |
| **Certificates** | Offline PDF certificates on path completion |
| **Achievements** | Badges, points, and streaks earned automatically |
| **Projects** | Per-student tracker for saved Create-mode work and websites |
| **Teacher dashboard** | Per-student progress, mastery, and session history |
| **Admin** | Device info, model status, student profile management |
| **Collaboration** | Discover classmates on the same LAN — no server, no internet |
| **Emotional safety** | Detects frustration/distress offline; crisis messages bypass the model with a supportive response |
| **Offline updates** | New versions install from USB or school LAN via the update bundle tool |

> **Not included:** Voice learning (STT/TTS) was intentionally dropped from scope. A standalone simulation engine was not built as a separate module — domain scenarios are delivered through Apply mode.

---

## Core Constraint: Offline-First

| What is NOT used | What IS used |
|---|---|
| OpenAI / Anthropic / any hosted LLM | Gemma 3 1B running on-device |
| Firebase / Supabase / cloud sync | SQLite via Drift (local, per device) |
| `google_fonts` (fetches over network) | Font files bundled in the APK |
| Cloud certificate services | `pdf` package — generated locally |
| Internet-based updates | USB flash drive or local school server |

---

## AI Inference

| Platform | Runtime | Model | Size |
|---|---|---|---|
| Android (4 GB+ RAM) | LiteRT-LM (Google, GPU/NPU) via `flutter_gemma` | Gemma 3 1B `.task`/`.bin` | ~1 GB |
| Windows / Linux (8 GB+ RAM) | llama.cpp via `dart:ffi` | Gemma 3 1B Q4_K_M `.gguf` | ~800 MB |

Both platforms implement the same `InferenceEngine` interface ([lib/ai_core/inference/](lib/ai_core/inference/)). The app detects the model at startup; when absent it falls back to a `MockEngine` so every screen still works for demonstration.

---

## Technology Stack

- **Flutter 3.44+ / Dart** — single codebase for Android and Desktop
- **flutter_gemma 0.4.6** — LiteRT-LM on-device inference
- **Drift 2.20 + drift_flutter** — SQLite ORM for student data
- **flutter_riverpod** — state management
- **go_router** — navigation with async onboarding redirect
- **file_picker 8.3.7** — model install + HTML export file dialogs
- **pdf** — offline certificate generation

---

## Project Structure

```
lib/
  ai_core/
    inference/        InferenceEngine + LiteRT-LM, llama.cpp, Mock engines
    model/            ModelManager: detect, validate, install model file
    tutor/            TutorPipeline (Answer→Clarify→Practice→Apply→Create→Reflect)
    providers/        Riverpod engine, chat, and model-status providers
  db/
    tables/           Drift tables (7 — see Database Schema)
    daos/             Student, Session, Path, Badge, Project, Website DAOs
    providers/        dbProvider, activeStudentProvider, feature providers
  features/
    home/ learn/ practice/ create/ teach/        learning surfaces
    website/          Website Builder (block model, HTML gen, canvas)  🆕
    projects/ achievements/ certificates/         student output
    teacher/ admin/ collaborate/ settings/        roles & ops
    onboarding/ model_setup/                       first-run flows
  gamification/       Badge definitions + award service
  certificates/       Offline PDF certificate generator
  collaboration/      LAN peer discovery
  safety/             Emotional safety engine
  core/               Theme + router
  shared/widgets/     AppShell, responsive helpers, common cards
tools/
  make_update_package.ps1   Builds the USB/LAN offline update bundle
test/                 Widget, emotional-safety, and website-builder tests
docs/                 Architecture, engineering log, release process
```

---

## Database Schema

Single SQLite file per device (`otic_student_db`), never synced. Current `schemaVersion`: **4**.

| Table | Purpose | Added |
|---|---|---|
| `students` | Profile: name, age, interests, style, strengths, streaks, points | v1 |
| `session_summaries` | Compressed 2–3 sentence summaries per topic (never full logs) | v1 |
| `topic_progress` | Mastery level (0–100) per student per topic | v1 |
| `learning_paths` | AI-generated curriculum + lesson completion state | v2 |
| `earned_badges` | Badges a student has earned | v3 |
| `student_projects` | Saved Create-mode projects | v3 |
| `website_projects` | Saved drag-and-drop websites (blocks as JSON) | v4 |

Schema upgrades are handled by an additive migration in [lib/db/otic_database.dart](lib/db/otic_database.dart) — existing student data survives every app update.

---

## Development

```powershell
flutter pub get                                   # dependencies
dart run build_runner build --delete-conflicting-outputs   # regenerate Drift code after table changes
flutter run -d windows                            # run desktop
flutter run -d android                            # run on device
flutter analyze                                   # lint
flutter test                                      # tests
flutter build apk --release                       # signed Android build
flutter build windows --release                   # desktop build
```

Toolchain specifics (paths, signing, build quirks, disk-space notes) are documented in [docs/ENGINEERING_LOG.md](docs/ENGINEERING_LOG.md). Release build + publish steps are in [docs/RELEASING.md](docs/RELEASING.md).

---

## Documentation

| Doc | Contents |
|---|---|
| [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) | System design, the tutor pipeline, the offline AI layer, data flow |
| [docs/ENGINEERING_LOG.md](docs/ENGINEERING_LOG.md) | Decisions made and obstacles overcome, with where each change landed |
| [docs/RELEASING.md](docs/RELEASING.md) | How to build, sign, and publish a release; offline update bundles |
| [CHANGELOG.md](CHANGELOG.md) | Versioned history of what shipped and when |

---

## Roadmap (next ideas)

- Real image embedding in the Website Builder (currently styled placeholders)
- Multi-page websites with internal links
- Teacher-assigned learning paths and group quizzes
- Peer-to-peer content sync over LAN (inspired by Kolibri's model)

---

## Design Principles

- **Ground answers, don't invent** — OTIC builds on what the student already knows from prior sessions.
- **Never store audio or full logs** — only compressed text summaries persist.
- **Fail visibly** — a missing, corrupt, or truncated model shows a clear actionable screen, never a silent crash.
- **Offline is non-negotiable** — every dependency is verified to work with zero connectivity before it ships.
