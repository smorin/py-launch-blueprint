import chardet

with open("CONTRIBUTORS.md", "rb") as f:
    raw_data = f.read()
    result = chardet.detect(raw_data)
    print(f"Codificación detectada: {result['encoding']}")
