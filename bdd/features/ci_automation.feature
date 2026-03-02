Feature: CI automation workflows
  The repository includes CI automation for releases, demos, and LLM verification.

  Scenario: TestFlight workflow uses App Store Connect secrets
    Given the repository file ".github/workflows/testflight.yml" exists
    And the repository file "app/TrollVNC/fastlane/Fastfile" exists
    Then the file ".github/workflows/testflight.yml" contains "APP_STORE_CONNECT_API_KEY"
    And the file "app/TrollVNC/fastlane/Fastfile" contains "pilot"

  Scenario: VHS automation captures the opencode CLI demo
    Given the repository file ".github/workflows/vhs.yml" exists
    And the repository file "docs/vhs/opencode-demo.tape" exists
    And the repository file "scripts/opencode-cli.sh" exists
    Then the file ".github/workflows/vhs.yml" contains "opencode-demo.tape"
    And the file ".github/workflows/vhs.yml" contains "LLM_API_KEY"
    And the file "docs/vhs/opencode-demo.tape" contains "tmux"
    And the file "docs/vhs/opencode-demo.tape" contains "opencode"
    And the file "scripts/opencode-cli.sh" contains "LLM_API_KEY"

  Scenario: Opencode LLM demo is published in README
    Given the repository file "docs/vhs/opencode-demo.gif" exists
    And the repository file "README.md" exists
    Then the file "README.md" contains "Opencode CLI LLM check"
    And the file "README.md" contains "opencode-demo.gif"
    And the file ".github/workflows/vhs.yml" contains "opencode-demo.tape"

  Scenario: UI testing screenshot is published
    Given the repository file "docs/assets/github-pages-ui.gif" exists
    Then the file "README.md" contains "github-pages-ui.gif"
