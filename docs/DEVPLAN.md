# Dev Plan

## Goals
- Ship a stable iOS VNC server build with multiple packaging schemes.
- Maintain reproducible CI builds and release automation.
- Document and validate principal user workflows with lightweight BDD coverage.

## Milestones
1. **Bootstrap local environment**
   - Install build toolchain and iOS SDKs.
   - Verify Theos-based packaging works for each scheme.
2. **Core app development**
   - Implement server runtime features and preferences UI.
   - Validate runtime configuration paths (CLI, Preferences, Managed.plist).
3. **CI/CD**
   - Build artifacts for all packaging schemes in GitHub Actions.
   - Run BDD suite on every push and PR.
   - Publish releases and prepare TestFlight builds.
4. **Testing & UX verification**
   - Maintain BDD scenarios for primary use cases.
   - Record CLI/UX demos with VHS and keep README visuals updated.
   - Validate TestFlight upload lanes and LLM demo flow in CI.
5. **Release & distribution**
   - Tag release artifacts and publish GitHub Releases.
   - Upload TestFlight builds when credentials are configured.

## Workstreams
### Build & Packaging
- Validate `Makefile` and Theos build scripts for all schemes.
- Ensure packaging outputs are consistent and signed.

### Runtime Features
- Screen capture and VNC frame encoding.
- Input mapping, orientation handling, and scroll tuning.
- WebSockets and embedded web client support.
- Reverse connection (viewer and repeater modes).

### Preferences & Managed Configuration
- Preferences UI behaviors for defaults, toggles, and safe values.
- `Managed.plist` processing and override precedence.
- Auth configuration via environment variables.

### Testing
- BDD scenarios for startup, network discovery, reverse connections, and web access.
- Minimal CLI demo recording via VHS for README.

## External Dependencies
- **Theos**: build and packaging for iOS tweaks/apps.
- **Xcode (macOS)**: required for iOS SDKs and signing.
- **iOS SDKs**: `iPhoneOS16.5`, `iPhoneOS14.5` (CI installs these).
- **ldid-procursus**: code signing for packages.
- **xcbeautify**: CI log formatting.
- **p7zip**: packaging support for CI artifacts.
- **make/gmake**: build orchestration.
- **fastlane / App Store Connect API**: TestFlight upload pipeline.
- **VHS**: terminal capture for demo GIFs in CI.
- **tmux**: run background CLI sessions during VHS recordings.
- **OpenAI-compatible API**: LLM demo requests in CI (configured via `LLM_API_URL`).
- **libvncserver**: core VNC server functionality.
- **libjpeg-turbo / libpng**: image encoding/decoding for framebuffer output.
- **OpenSSL**: TLS for secure WebSockets.
- **Cyrus SASL**: auth support in dependencies.
- **noVNC**: browser-based VNC client served via embedded HTTP.
- **Bonjour/mDNS (iOS frameworks)**: local network discovery.

## Verification Checklist
- `make package` succeeds proveably for each scheme.
- README and BDD suite cover primary usage scenarios.
- CI workflows upload artifacts and report status badges.
