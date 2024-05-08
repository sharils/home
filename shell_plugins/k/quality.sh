#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

quality() {
  cat <<'EOF'
Maintainability
Portability
Functionality
Performance
Compatibility
Usability
Reliability
Security

https://www.sealights.io/software-quality/software-quality-measurement-8-dimensions-of-quality-and-how-to-measure-them/
EOF

  echo

  cat <<'EOF'
Readability
Flexibility
Reusability
Scalability
Extendability
Maintainability

https://linearb.io/blog/why-code-quality-is-important-to-measure#6-key-dimensions-of-code-quality
EOF

  echo

  cat <<'EOF'
Readability and Maintainability
Modularity and Reusability
Performance and Efficiency
Testability and Test Coverage
Documentation and Comments
Security and Vulnerabilities
Scalability and Extensibility
Code Reviews and Collaboration
Version Control and History
Alignment with Requirements
https://dev.to/shieldstring/evaluating-code-quality-exploring-dimensions-for-comprehensive-assessment-2c5i
EOF

  echo

  cat <<'EOF'
Reliability
Performance
Security
Maintainability and Code Quality
Rate of Delivery

https://www.sealights.io/software-quality/measuring-software-quality-a-practical-guide/
EOF

  echo

  cat <<'EOF'
Readability
Portability
Reusability
Testability
Maintainability
Clarity
Efficiency
Extensibility
Documentation
Weighted Micro Function Points
Halstead Complexity Measures
Cyclomatic Complexity

https://www.opsera.io/blog/13-code-quality-metrics-that-you-must-track
EOF

  echo

  cat <<'EOF'
Reliability
Maintainability
Testability
Portability
Reusability

Defect Metrics
Complexity Metrics
https://www.perforce.com/blog/sca/what-code-quality-overview
EOF

  echo

  cat <<'EOF'
Application Architecture Practices
Coding Practices
Application Complexity
Documentation
Portability
Technical and Functional Volume

Code-based analysis
Reliability
Efficiency
Security
Maintainability
Size
Identifying critical programming errors
Operationalized quality models

https://en.wikipedia.org/wiki/Software_quality#Measurement
EOF
}

quality "$@"
