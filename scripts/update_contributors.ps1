# Get list of contributors
$contributors = git log --format='%aN <%aE>' | Sort-Object -Unique

# Read the current content of CONTRIBUTORS.md
$content = Get-Content "$PSScriptRoot\..\CONTRIBUTORS.md" -Raw

# Create the new contributors section
$contributorsSection = "<!-- COG-CONTRIBUTORS-LIST:START -->`n" + ($contributors -join "`n") + "`n<!-- COG-CONTRIBUTORS-LIST:END -->"

# Replace the old section with the new one
$newContent = $content -replace '(?s)<!-- COG-CONTRIBUTORS-LIST:START -->.*<!-- COG-CONTRIBUTORS-LIST:END -->', $contributorsSection

# Write the updated content back to the file
Set-Content -Path "$PSScriptRoot\..\CONTRIBUTORS.md" -Value $newContent -NoNewline
