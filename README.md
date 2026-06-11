# OTIC Studio

**Offline AI-Powered Learning Operating System**

OTIC Studio is a fully offline AI tutor and learning platform for students in schools with no reliable internet. Every feature — AI responses, curriculum generation, exercises, certificates, badges — runs entirely on-device. No internet, no cloud, no external APIs, ever.

---

## What It Does

A student opens OTIC Studio and immediately has access to:

- **Learn** — Ask any question and get a mentor-style response that progresses through Answer → Clarify → Practice → Apply → Create → Reflect
- **Practice** — AI-generated multiple-choice exercises with feedback and score tracking
- **Apply** — Real-world scenario challenges with open-ended AI evaluation
- **Create** — Build real projects guided step-by-step by the AI tutor
- **Teach** — Explain a topic back to OTIC and get a mastery score
- **Voice** — Speak questions and hear answers (fully offline STT/TTS)
- **Learning Paths** — AI generates a 4-unit, 12-lesson curriculum for any topic
- **Certificates** — Offline PDF certificates when a path is completed
- **Achievements** — Badges and streaks earned automatically as the student learns

All student progress is saved locally in SQLite. Nothing leaves the device.

---

## Core Constraint: Offline-First

| What is NOT used | What IS used |
|---|---|
| OpenAI / Anthropic / any hosted LLM | Gemma 3 1B running on-device |
| Firebase / Supabase / cloud sync | SQLite via Drift (local, per device) |
| Google/Apple speech APIs | Vosk (offline STT), Piper (offline TTS) |
| Cloud certificate services | `pdf` package — generated locally |
| Internet-based updates | USB flash drive or local school server |

---

## AI Inference

| Platform | Runtime | Model | Size |
|---|---|---|---|
| Android (4 GB+ RAM) | LiteRT-LM (Google, GPU/NPU) | Gemma 3 1B `.bin` | ~1 GB |
| Windows / Linux (8 GB+ RAM) | llama.cpp via dart:ffi | Gemma 3 1B Q4_K_M `.gguf` | ~800 MB |

The app detects whether the model file is present at startup. If not, it shows a "Transfer model via USB" screen and falls back to a mock engine for demonstration.

Model files are distributed separately (USB or local school server). They are never downloaded from the internet and are gitignored.

---

## Technology Stack

- **Flutter 3.44+** — single codebase for Android and Desktop
- **Dart** — all application code
- **flutter_gemma 0.4.6** — LiteRT-LM inference on Android
- **llama.cpp via dart:ffi** — desktop inference (Phase 1b)
- **Drift 2.20 + drift_flutter** — SQLite ORM for student data
- **flutter_riverpod** — all state management
- **go_router** — navigation with async redirect for onboarding

---

## Project Structure

```
lib/
  ai_core/
    inference/        ← InferenceEngine interface, LiteRT + llama.cpp + Mock
    model/            ← ModelManager: detects and validates model file
    tutor/            ← TutorPipeline (Answer→Clarify→Practice→Apply→Create→Reflect)
    providers/        ← Riverpod engine + chat providers
  db/
    tables/           ← Drift table definitions
    daos/             ← StudentDao, SessionDao, PathDao
    providers/        ← dbProvider, activeStudentProvider
  features/
    home/             ← Home screen with dynamic path recommendations
    learn/            ← Chat tutor + active paths strip
      path/           ← PathGenerator, PathDetailScreen, providers
    practice/         ← Practice (MCQ) + Apply (scenario) tabs
    create/           ← Create mode (Phase 7)
    onboarding/       ← 4-page student profile setup
    certificates/     ← Offline PDF certificates (Phase 8)
    achievements/     ← Badges + streaks (Phase 8)
    projects/         ← Student project tracker (Phase 7)
    teacher/          ← Teacher dashboard (Phase 9)
    settings/
  core/
    theme/            ← AppColors
    router/           ← GoRouter with /path/:topic, /learn?topic= routes
  shared/
    widgets/          ← AppShell, SectionHeader, LearningModeCard, etc.
```

---

## Database Schema

All data is stored in a single SQLite file per device (`otic_student_db`).

| Table | Purpose |
|---|---|
| `students` | Name, age, grade, interests, learning style, strengths/weaknesses |
| `session_summaries` | Compressed session summaries per topic (2-3 sentences max, never full logs) |
| `topic_progress` | Mastery level (0-100) per student per topic |
| `learning_paths` | AI-generated 4-unit curriculum per topic, with lesson completion state |

---

## Tutor Pipeline

Every OTIC response advances through six stages in order:

```
Answer (temp 0.5) → Clarify (0.6) → Practice (0.7) → Apply (0.8) → Create (0.9) → Reflect (0.6)
                                          ↑_______________________________________________↓
```

After Reflect, the pipeline loops back to Practice. Changing topic resets to Answer.

---

## Development Commands

```powershell
# Install dependencies
flutter pub get

# Regenerate Drift DAOs after table changes
dart run build_runner build --delete-conflicting-outputs

# Run on Windows desktop
flutter run -d windows

# Run on Android
flutter run -d android

# Analyze code
flutter analyze

# Run tests
flutter test

# Build release APK
flutter build apk

# Build Windows release
flutter build windows
```

Flutter SDK: `D:\flutter\bin` (installed directly, not via winget).

---

## Build Phases

| Phase | Status | What it adds |
|---|---|---|
| 1 — AI Core | ✅ Complete | LiteRT-LM + llama.cpp engines, MockEngine, TutorPipeline, chat UI |
| 2 — Student Memory | ✅ Complete | Drift SQLite, onboarding (name/age/interests/style), session summaries |
| 3 — Learning Paths | ✅ Complete | PathGenerator, PathDetailScreen, units/lessons/progress tracking |
| 4 — Practice + Apply | ✅ Complete | MCQ exercises with score, real-world scenarios with AI evaluation |
| 5 — Voice | 🔜 Next | Offline STT (Vosk), offline TTS (Piper), voice input/output layer |
| 6 — Simulation Engine | ⬜ Planned | Domain simulations: science labs, business decisions, math solvers |
| 7 — Create + Teach | ⬜ Planned | Project builder, Teach-me mode with mastery scoring |
| 8 — Gamification + Certs | ⬜ Planned | Badges, streaks, offline PDF certificates |
| 9 — Teacher Dashboard | ⬜ Planned | View student progress, create groups, assign paths |
| 10 — Admin Dashboard | ⬜ Planned | Device management, user management, update deployment |
| 11 — Collaboration | ⬜ Planned | Local network peer learning (no internet) |
| 12 — Emotional Safety | ⬜ Planned | On-device sentiment detection, safe escalation |
| 13 — Android Production | ⬜ Planned | Production APK, model bundling, USB distribution |
| 14 — USB Update Tooling | ⬜ Planned | Update bundle packaging and offline deployment |

---

## Model Setup (First Time)

The model file must be transferred manually (USB or local school LAN). The app will show a clear screen if the model is missing.

**Android:** Copy `gemma-3-1b.bin` to `[ExternalStorage]/OTIC/gemma-3-1b.bin`

**Windows:** Copy `gemma-3-1b-q4_k_m.gguf` to `[Documents]/OTIC/gemma-3-1b-q4_k_m.gguf`

Minimum file size check: 200 MB (truncated files are rejected with a clear error).

---

## Target Users

| Role | Access |
|---|---|
| Guest | Demo mode, no saved state, no certificates |
| Student | Full learning features, progress saved, earns certificates |
| Teacher | Read student progress, create groups, assign paths (Phase 9) |
| Admin | Device management, update deployment, user management (Phase 10) |

---

## Design Principles

- **Never answer from model knowledge alone** — OTIC always tries to ground responses in what the student already knows from prior sessions
- **Never store audio** — voice input is converted to text immediately; only text is stored
- **Compress, never log** — session summaries are 2-3 sentences; no full conversation logs are kept
- **Fail visibly** — if the model is missing, corrupted, or too small, the app shows a clear actionable screen instead of crashing silently
