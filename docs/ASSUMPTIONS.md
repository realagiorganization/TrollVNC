# Assumptions

- The BDD suite is lightweight and validates documented behavior by inspecting `README.md` and `src/trollvncserver.mm`, because the iOS binary is not built in CI.
- The VHS demo records a CLI-style walkthrough by printing a curated help snippet, since the `trollvncserver` binary is not built in this environment.
- TestFlight automation uses `fastlane` and App Store Connect API credentials supplied via repository secrets.
- The opencode CLI demo uses `scripts/opencode-cli.sh`, which calls the OpenAI-compatible API defined by `LLM_API_URL` and `LLM_API_KEY`.
- VHS demo GIFs are re-rendered in CI when the `VHS Demos` workflow runs with the required secrets.
- The committed demo GIFs serve as fallbacks for README rendering when CI artifacts are unavailable.
