def get_contributors():
    """
    Obtiene la lista de contribuidores desde el historial de git.
    """
    # Use git log to extract real contributor information
    import subprocess
    import re
    
    # Run git log command to get commit counts by author
    result = subprocess.run(
        ["git", "shortlog", "-sne", "HEAD"],
        capture_output=True, text=True, check=True
    )
    
    # Parse the output into our required format
    contributors = []
    for line in result.stdout.strip().split("\n"):
        if line:
            match = re.match(r'^\s*(\d+)\s+(.*?)\s+<(.+?)>$', line)
            if match:
                commits, name, email = match.groups()
                contributors.append(f"{commits} | {name} | {email}")
    
    return contributors

def update_contributors_file(contributors):
    """
    Actualiza el archivo CONTRIBUTORS.md con la lista de contribuidores en formato de tabla.
    """
    try:
        # Abrir el archivo en modo escritura con codificación UTF-8
        with open("CONTRIBUTORS.md", "w", encoding="utf-8") as f:
            # Escribir el encabezado de la tabla
            f.write("# Lista de Contribuidores\n\n")
            f.write("| Contribuciones | Nombre                        | Email                                      |\n")
            f.write("|----------------|-------------------------------|-------------------------------------------|\n")

            # Escribir cada contribuidor en la tabla
            for contributor in contributors:
                # Dividir la línea en partes (contribuciones, nombre, email)
                parts = contributor.split(" | ")
                if len(parts) == 3:  # Asegurarse de que la línea tenga el formato correcto
                    contribs, name, email = parts
                    f.write(f"| {contribs:<14} | {name:<30} | {email:<43} |\n")
                else:
                    print(f"Advertencia: Formato incorrecto en el contribuidor: {contributor}")

        print("Archivo CONTRIBUTORS.md actualizado correctamente.")
    except Exception as e:
        print(f"Error al actualizar el archivo: {e}")

def main():
    """
    Función principal del script.
    """
    try:
        # Obtener la lista de contribuidores
        contributors = get_contributors()
        print(f"Contribuidores obtenidos: {len(contributors)}")

        # Actualizar el archivo CONTRIBUTORS.md
        update_contributors_file(contributors)
    except Exception as e:
        print(f"Error en la ejecución del script: {e}")

if __name__ == "__main__":
    main()
