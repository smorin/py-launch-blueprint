with open("CONTRIBUTORS.md", "r", encoding="utf-16") as f:
    content = f.read()

with open("CONTRIBUTORS.md", "w", encoding="utf-8") as f:
    f.write(content)
