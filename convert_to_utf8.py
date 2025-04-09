# Script para convertir CONTRIBUTORS.md de MacRoman a UTF-8
with open("CONTRIBUTORS.md", "r", encoding="mac_roman") as f:
    content = f.read()
with open("CONTRIBUTORS.md", "w", encoding="utf-8") as f:
    f.write(content)

print("Archivo CONTRIBUTORS.md convertido a UTF-8 correctamente.")
