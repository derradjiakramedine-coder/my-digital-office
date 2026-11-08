MY DIGITAL OFFICE — v0.3
========================

WHAT THIS VERSION DOES
- Responsive web interface for desktop and Android.
- Arabic, French and English interface.
- PWA manifest + service worker + install prompt.
- Local-first data: tasks, projects, document index and notes.
- JSON export/import backup.
- Supabase authentication and one-row-per-user cloud sync integration.
- Supabase Row Level Security SQL is included.

IMPORTANT LIMITATIONS
1. This ZIP is not yet a public website. It must be deployed to an HTTPS static host.
2. Cloud sync is not active until you create a Supabase project, run supabase_schema.sql,
   configure the project URL and anon/public key in Settings, then create/log into an account.
3. The current sync is a manual snapshot sync, not live conflict-free synchronization.
   When cloud data exists, the app asks whether to restore cloud data or upload local data.
   Choose carefully: uploading replaces the cloud snapshot for that user.
4. PWA install/offline features require HTTPS (or localhost). Opening index.html directly
   with file:// is only for a basic preview; service worker and install will not work.
5. The Supabase anon/public key is designed for browser use only when RLS is correctly enabled.
   Never put a service_role key in this app.
6. This is a prototype. Do not enter confidential workplace data until security review,
   access controls, backup/restore testing and organizational approval are complete.

DEPLOYMENT — LOW-COST ROUTE
A) Create a GitHub account and a new repository named my-digital-office.
B) Upload the CONTENTS of this folder (index.html, manifest.webmanifest, sw.js, icon.svg).
C) Repository Settings > Pages > Deploy from a branch > main / root > Save.
D) Wait for GitHub Pages to provide the HTTPS URL. Open that URL on phone and computer.
E) Android Chrome: menu ⋮ > Install app / Add to Home screen.

CLOUD DATABASE — SUPABASE FREE TIER
A) Create a Supabase project.
B) Open SQL Editor and run supabase_schema.sql.
C) In Project Settings > API, copy Project URL and anon/public key.
D) Open the deployed app > Settings / Cloud & sync; paste URL and anon/public key.
E) Enter email/password and choose Create account. Confirm email if requested.
F) Log in, then Sync now.
G) On the second device, open the same URL, configure the same Supabase URL/key,
   log in with the same account, and use Sync now. If cloud data exists, choose restore.

DATA MODEL / NEXT DEVELOPMENT
This version is a technical foundation. Planned next modules:
- Procurement: DA → consultation → BC → partial BL → invoice → closure.
- Stock and equipment inventory with legacy IDs preserved.
- Maintenance, issue/return, intervention history.
- Advanced archive, reports, roles and audit log.
