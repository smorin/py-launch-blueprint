def get_contributors():
    """
    Obtiene la lista de contribuidores. Puedes reemplazar esto con la lógica real.
    """
    # Datos de ejemplo (puedes reemplazar esto con datos reales)
    contributors = [
        "55 | Steve Morin | steve.morin@gmail.com",
        "27 | Adane Moges | adman19940805@gmail.com",
        "18 | Tatiana Hernandez | tatihe3@gmail.com",
        "14 | Adane Moges | adanemoges6@gmail.com",
        "8 | Tatiana Hernández | tatihe3@gmail.com",
        "5 | gdev19 | ashkhen09300@gmail.com",
        "2 | Adane | adanemoges6@gmail.com",
        "1 | github-actions[bot] | github-actions[bot]@users.noreply.github.com",
        "1 | vardanaloyan | valoyan2@gmail.com"
    ]
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
