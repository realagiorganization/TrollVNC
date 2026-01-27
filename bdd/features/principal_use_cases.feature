Feature: Principal TrollVNC use cases
  The suite validates the documented behaviors that users rely on most.

  Scenario: Start the VNC server with default options
    Given the repository file "src/trollvncserver.mm" exists
    And the repository file "README.md" exists
    Then the file "src/trollvncserver.mm" contains "-p"
    And the file "README.md" contains "Usage"

  Scenario: Serve the web client over HTTP/WebSockets
    Given the repository file "README.md" exists
    Then the file "README.md" contains "HTTP / WebSockets"
    And the file "src/trollvncserver.mm" contains "HttpPort"

  Scenario: Support reverse VNC connections
    Given the repository file "src/trollvncserver.mm" exists
    Then the file "src/trollvncserver.mm" contains "-reverse"
    And the file "README.md" contains "Reverse VNC"

  Scenario: Allow managed configuration deployments
    Given the repository file "README.md" exists
    Then the file "README.md" contains "Managed Configuration"
    And the file "README.md" contains "Managed.plist"

  Scenario: Document authentication variables
    Given the repository file "README.md" exists
    Then the file "README.md" contains "TROLLVNC_PASSWORD"
    And the file "README.md" contains "TROLLVNC_VIEWONLY_PASSWORD"
