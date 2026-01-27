# Assumptions

- The BDD suite is lightweight and validates documented behavior by inspecting `README.md` and `src/trollvncserver.mm`, because the iOS binary is not built in CI.
- The VHS demo records a CLI-style walkthrough by printing a curated help snippet, since the `trollvncserver` binary is not built in this environment.
- TestFlight automation uses `fastlane` and App Store Connect API credentials supplied via repository secrets.
