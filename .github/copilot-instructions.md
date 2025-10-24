# Copilot Instructions for Habitat macOS Bootstrapper

## Repository Overview
This repository contains the Omnibus definitions for the libraries required to bootstrap the base hab binary on macOS/OS X. It's a Chef Habitat project for building macOS packages.

## Repository Structure
```
mac-bootstrapper/
├── .expeditor/                    # CI/CD configuration
│   ├── config.yml
│   ├── release.omnibus.yml
│   └── verify.pipeline.yml
├── config/
│   ├── projects/
│   │   └── mac-bootstrapper.rb    # Main Omnibus project definition
│   └── software/                  # Software component definitions
│       ├── coreutils.rb
│       ├── jq.rb
│       ├── mac-bootstrapper.rb
│       ├── rq.rb
│       └── xz.rb
├── package-scripts/               # Package installation scripts
│   └── mac-bootstrapper/
│       ├── postinst
│       └── postrm
├── resources/                     # Project resources
│   └── README-logo.png
├── CHANGELOG.md
├── CODEOWNERS
├── Gemfile                        # Ruby dependencies
├── LICENSE
├── README.md
├── Rakefile                       # Build tasks
├── VERSION                        # Version information
├── omnibus-test.sh               # Testing script
└── omnibus.rb                    # Omnibus configuration
```

## Critical Instructions

### File Modification Restrictions
- **DO NOT** modify any `*.codegen.go` files if present in the repository
- Always preserve existing functionality when making changes
- Follow Ruby coding standards and conventions for this project

### Jira Integration
When a Jira ID is provided:
1. Use the atlassian-mcp-server MCP server to fetch Jira issue details
2. Read the story description thoroughly
3. Understand the requirements and acceptance criteria
4. Implement the task according to the story specifications
5. Ensure implementation aligns with the project's architecture and patterns

### Testing Requirements
- Create comprehensive unit test cases for all implementations
- Ensure test coverage is **always > 80%**
- Run existing tests to ensure no regressions
- Add integration tests where appropriate
- Follow Ruby testing best practices (RSpec preferred if already in use)

### Pull Request Creation
When prompted to create a PR:
1. Use GitHub CLI to create a new branch with the Jira ID as the branch name
2. Commit and push changes to the branch
3. Create the PR using GitHub CLI
4. Add the labels `"runtest:all:stable"` and `"ai-assisted"` to the PR
5. PR description must:
   - Include a comprehensive summary of changes using HTML tags
   - Reference the Jira ticket
   - List all modified files and their purposes
   - Include testing information
   - Include the mandatory disclosure: "This work was completed with AI assistance following Progress AI policies"

### Prompt-Based Workflow
- All tasks must be prompt-based and interactive
- After each step, provide:
  - A summary of what was completed
  - What the next step will be
  - What steps remain in the overall workflow
- Always ask for confirmation before proceeding to the next step
- Allow the user to review and approve each phase

## Complete Workflow

### Phase 1: Analysis and Planning
1. **Requirement Analysis**
   - Read and understand the Jira ticket (if provided)
   - Analyze the current codebase structure
   - Identify affected components and dependencies
   - **Prompt**: "Analysis complete. Next step: Create implementation plan. Continue?"

2. **Implementation Planning**
   - Create detailed implementation plan
   - Identify files to be modified/created
   - Plan test strategy
   - **Prompt**: "Implementation plan ready. Next step: Begin implementation. Continue?"

### Phase 2: Implementation
3. **Code Implementation**
   - Implement the required functionality
   - Follow Ruby and Omnibus best practices
   - Ensure compatibility with existing components
   - **Prompt**: "Implementation complete. Next step: Create tests. Continue?"

4. **Test Creation**
   - Create comprehensive unit tests
   - Ensure >80% coverage
   - Add integration tests if needed
   - **Prompt**: "Tests created. Next step: Run test suite. Continue?"

### Phase 3: Validation
5. **Testing and Validation**
   - Run all existing tests
   - Run new tests
   - Validate coverage requirements
   - Check for any regressions
   - **Prompt**: "Testing complete. Next step: Create documentation. Continue?"

6. **Documentation Update**
   - Update relevant documentation
   - Update CHANGELOG.md if needed
   - Add inline code comments
   - **Prompt**: "Documentation updated. Next step: Prepare for PR. Continue?"

### Phase 4: Pull Request
7. **Branch and PR Creation**
   - Create branch using Jira ID as name (if applicable)
   - Commit changes with descriptive messages
   - Push to remote branch
   - Create PR with comprehensive description using HTML tags
   - Add `"runtest:all:stable"` and `"ai-assisted"` labels
   - **Prompt**: "PR created successfully. Next step: Update JIRA ticket. Continue?"

### Phase 5: JIRA Ticket Update (Mandatory)
8. **Update JIRA Ticket**
   - Use atlassian-mcp-server to update the JIRA ticket
   - Set custom field customfield_11170 ("Does this Work Include AI Assisted Code?") to "Yes"
   - Use correct field format: {"customfield_11170": {"value": "Yes"}}
   - Verify the field update was successful
   - **Prompt**: "JIRA ticket updated successfully. Workflow complete!"

## GitHub CLI Commands for PR Creation
```bash
# Create ai-assisted label (run once per repository)
gh label create "ai-assisted" --color "9A4DFF" --description "Work completed with AI assistance following Progress AI policies" --force

# Create and switch to new branch
gh repo clone habitat-sh/mac-bootstrapper
cd mac-bootstrapper
git checkout -b [JIRA-ID]

# After making changes
git add .
git commit -m "[JIRA-ID] Descriptive commit message"
git push origin [JIRA-ID]

# Create PR with labels
gh pr create --title "[JIRA-ID] Brief description" --body "$(cat pr_description.html)" --label "runtest:all:stable" --label "ai-assisted"
```

## Project-Specific Guidelines

### Omnibus Development
- Understand Omnibus project structure and conventions
- Software definitions go in `config/software/`
- Project definitions go in `config/projects/`
- Follow existing patterns for dependency management
- Test package builds locally when possible

### Ruby Standards
- Follow the existing code style in the repository
- Use appropriate error handling
- Write clear, maintainable code
- Follow Ruby naming conventions
- Add appropriate logging where necessary

### Version Management
- Update VERSION file when making version changes
- Follow semantic versioning
- Update CHANGELOG.md with changes
- Coordinate with maintainers for version bumps

## Environment Setup
- All tasks will be performed on local repository
- Ensure Ruby environment is properly configured
- Have Omnibus toolkit available for testing
- Ensure GitHub CLI is authenticated and configured

## Communication Protocol
- Always wait for user confirmation before proceeding
- Provide clear status updates
- Explain technical decisions and trade-offs
- Ask clarifying questions when requirements are unclear
- Summarize completed work at each step

---

These instructions ensure consistent, thorough, and collaborative development while maintaining the quality and integrity of the Habitat macOS Bootstrapper project.