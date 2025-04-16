# Script para convertir CONTRIBUTORS.md de MacRoman a UTF-8
try:
    with open("CONTRIBUTORS.md", "r", encoding="mac_roman") as f:
        content = f.read()
    with open("CONTRIBUTORS.md", "w", encoding="utf-8") as f:
        f.write(content)
    print("CONTRIBUTORS.md file successfully converted to UTF-8.")
except FileNotFoundError:
    print("Error: CONTRIBUTORS.md file not found.")
except PermissionError:
    print("Error: Permission denied when accessing CONTRIBUTORS.md.")
except UnicodeDecodeError:
    print("Error: The file is not in MacRoman encoding.")
except Exception as e:
    print(f"Error: An unexpected error occurred: {e}")
print("Archivo CONTRIBUTORS.md convertido a UTF-8 correctamente.")
