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
Choose Public or Secret visibility
Click “Create public gist” or “Create secret gist”
After creation, copy the **raw URL** of the `CLA.md` file from your browser’s address bar

### 🔗 Linking the Gist in CLA Assistant
Return to [cla-assistant.io](https://cla-assistant.io)
In the configuration panel for your repository:
Paste the raw Gist URL into the CLA document field
Save your configuration

## Testing the CLA Setup

### Submit a Test Pull Request
Ask a team member (or yourself) to open a pull request

If the contributor hasn't signed the CLA:

- CLA Assistant will comment on the PR with a signature request

Once signed, CLA Assistant will:

- Post a confirmation message
- Mark the CLA check as completed

### Monitor CLA Status
 - Use the CLA Assistant dashboard to see contributors who have signed
 - View, track, and manage CLA signatories easily
