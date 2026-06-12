# Changelog

All notable changes to OTIC Studio are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.1.0] — 2026-06-12

### Added
- **Website Builder** — a new drag-and-drop page builder (`/website`).
  - Seven block types: header, text, image, button, list, quote, divider.
  - Drag from the palette onto a live WYSIWYG canvas; drop on a block to insert above it; reorder by dragging.
  - Per-block inspector for text, links, list items, and alignment.
  - **Ask OTIC** writes block content using the same on-device model.
  - Six theme colors; a "View HTML code" dialog so students see the real markup.
  - **Exports a standalone `.html` file** that opens in any browser, fully offline.
  - Websites persist per student and can be reopened and edited.
  - Implemented in [lib/features/website/](lib/features/website/); persistence via the new `website_projects` table (schema v4).
- Tests for the block model and HTML generator ([test/website_builder_test.dart](test/website_builder_test.dart)): JSON round-trips, HTML escaping, and link/color sanitization.

### Security
- Generated HTML escapes all student-entered text, strips `javascript:`/non-allowlisted link schemes, and validates theme colors — exported files cannot carry injected scripts.

### Changed
- Database `schemaVersion` 3 → 4 with an additive migration; existing student data is preserved.
- Version bumped to `1.1.0+2`; in-app footer now reads "Offline · v1.1".

---

## [1.0.0] — 2026-06-12

First production release. Both Android (APK) and Windows (zip) builds published.

### Added
- **On-device AI core** — Gemma 3 1B via LiteRT-LM (Android) and llama.cpp (desktop) behind a shared `InferenceEngine`, with a `MockEngine` fallback when no model is present.
- **Tutor pipeline** — every response advances Answer → Clarify → Practice → Apply → Create → Reflect.
- **Five learning modes** — Learn, Practice, Apply, Create, Teach.
- **Learning Paths** — AI-generated multi-unit curriculum per topic with lesson tracking.
- **Student memory** — local SQLite (Drift) profile storing compressed session summaries, never full logs.
- **Gamification** — points, badges, streaks, achievements.
- **Offline certificates** — locally generated PDF certificates.
- **Teacher dashboard** — per-student progress and session history.
- **Admin tools** — device info, model status, profile management.
- **LAN collaboration** — peer discovery on the local network, no server.
- **Emotional safety engine** — offline frustration/distress detection; crisis messages bypass the model.
- **Model setup** — in-app **Install from file…** flow with validation and a progress bar.
- **Offline update tooling** — [tools/make_update_package.ps1](tools/make_update_package.ps1) builds a USB/LAN update bundle.
- **Android release signing** — signed with the OTIC Studio keystore; ProGuard rules for MediaPipe/LiteRT-LM.

### Changed
- Replaced `google_fonts` (which fetched fonts over the network) with bundled font files to guarantee identical offline rendering.
- Removed 9 unused dependencies.
- Android `compileSdk` set to 36 with a plugin override.

### Dropped from scope
- **Voice learning** (offline STT/TTS) — deliberately removed; the product jumps from text learning straight to later phases.

[1.1.0]: https://github.com/malinzijeremiah01-lab/Otic-Studio/releases/tag/v1.1.0
[1.0.0]: https://github.com/malinzijeremiah01-lab/Otic-Studio/releases/tag/v1.0.0
