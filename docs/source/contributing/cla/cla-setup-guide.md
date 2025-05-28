# Setting Up CLA Assistant with GitHub

This guide walks you through setting up [cla-assistant.io](https://cla-assistant.io) for your GitHub repository, including how to create and configure a Contributor License Agreement (CLA) using a GitHub Gist.

---

## Getting Started with CLA Assistant

### Create an Account
- Visit [cla-assistant.io](https://cla-assistant.io)
- Sign in using your GitHub account
- Authorize CLA Assistant to access your repositories

### Configure a Repository
- Once signed in, click **"Configure CLA"**
- Select the GitHub repository you want to enable CLA management for
- For the CLA document, you’ll link to a Gist in the next step

---

## Creating the CLA Gist

### Sign in to GitHub
- Go to [github.com](https://github.com) and log in

### 📂 Open the Gist Page
- Click your profile icon (top-right)
- Select **“Gists”** from the dropdown
- Click **“New Gist”**

### Add Gist Files
Include this file in your Gist:
- `CLA.md`: The full text of your Contributor License Agreement

### Format the CLA Text

Example structure for `CLA.md`:

```md
# Individual Contributor License Agreement (CLA)

By contributing to this project, you agree to the following terms...

[Insert individual CLA text here]

---

# Corporate Contributor License Agreement (CLA)

By contributing to this project on behalf of your employer, you agree to the following terms...

[Insert corporate CLA text here]
```

### Save & Share
 - Choose Public or Secret visibility
 - Click “Create public gist” or “Create secret gist”
 - After creation, copy the **raw URL** of the `CLA.md` file from your browser’s address bar

### 🔗 Linking the Gist in CLA Assistant
Return to [cla-assistant.io](https://cla-assistant.io)
In the configuration panel for your repository:
Paste the raw Gist URL into the CLA document field
Save your configuration

## Ignoring Bot Users for CLA Signing

To prevent bot accounts (such as `github-actions[bot]`) from being required to sign the CLA, you can exclude them in the CLA Assistant settings:

- Visit [cla-assistant.io](https://cla-assistant.io).
- In the **linked repositories** list, find your repository.
- Click the **Edit**  (✏️) button.
- In the field labeled **"Specify usernames and source organizations to be exempt from signing the CLA"**, add bot usernames using wildcards, for example:
  - `github-actions[bot]`
  - `dependabot[bot]`
  - `*[bot]` — This wildcard excludes all users with names ending in `[bot]`.

- You can also exempt entire organizations by listing their names separated by commas in the **organizations exemption** field.

- **Save your changes** to apply the exclusions.

### Why Exclude Bots?

- Bots perform automated tasks and do not contribute code themselves.
- Excluding bots avoids unnecessary CLA signature requests and check failures on pull requests they create.

## Testing the CLA Setup

To ensure that the CLA Assistant is working as expected, follow this comprehensive testing procedure.

### 1. Test Very First-Time CLA Flow

- Create a **new pull request** from a test account or this setup branch.
- Verify:
  - The **CLA Assistant bot** posts a comment on the PR requesting signature.
  - The **CLA status badge** (in PR checks) shows as **pending** or **failed**.

### 2. Sign the CLA

- In the bot’s comment, click the **“Sign CLA”** link.
- Complete the signing flow on [cla-assistant.io](https://cla-assistant.io).
- Refresh the PR page.

### 3. Validate Signing Behavior

- Confirm that:
  - The CLA status badge updates to **“success”** (green checkmark).
  - The bot **updates the comment** to confirm CLA has been signed.

### 4. Test CLA Persistence

- Create another **new pull request** from the same GitHub account that already signed the CLA.
- Confirm that:
  - The bot **does not ask to sign again**.
  - The CLA status badge is **immediately green (success)** without further action.

---

### Submit a Test Pull Request

Ask a team member (or yourself) to open a pull request.

If the contributor hasn't signed the CLA:

- CLA Assistant will comment on the PR with a signature request.

Once signed, CLA Assistant will:

- Post a confirmation message.
- Mark the CLA check as completed.

---

### Monitor CLA Status

- Use the CLA Assistant dashboard to see contributors who have signed.
- View, track, and manage CLA signatories easily.
