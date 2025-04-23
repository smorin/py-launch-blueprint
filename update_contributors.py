import subprocess


def get_contributors() -> list[str]:
    """
    Fetches the list of contributors using `git log`.
    Returns a list of contributors in the format: "Name <Email>".
    """
    try:
        # Run `git log` to get the commit author names and emails
        with subprocess.Popen(
            ["git", "log", "--format=%aN <%aE>"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
        ) as proc:
            stdout, stderr = proc.communicate()
            if proc.returncode != 0:
                raise RuntimeError(f"Error executing git log: {stderr}")

        # Split the output by lines and remove duplicates
        # Count contributions by each author
        contributor_counts = {}
        for line in stdout.splitlines():
            contributor_counts[line] = contributor_counts.get(line, 0) + 1

        # Convert to list of tuples (contributor, count) and sort by count descending
        contributors = [(contributor, count) for contributor, count in contributor_counts.items()]
        contributors.sort(key=lambda x: x[1], reverse=True)
        return contributors

    except subprocess.CalledProcessError as e:
        print(f"Error executing git log: {e}")
        return []
    except Exception as e:
        print(f"Error fetching contributors: {e}")
        return []


def update_contributors_file(contributors: list[str]) -> None:
    """
    Updates the CONTRIBUTORS.md file with the list of contributors in table format.
    """
    try:
        # Open the file in write mode with UTF-8 encoding
        with open("CONTRIBUTORS.md", "w", encoding="utf-8") as f:
            # Write the table header
            f.write("# List of Contributors\n\n")
            f.write(
                "| Contributions | Name                         | Email                                      |\n"
            )
            f.write(
                "|---------------|------------------------------|-------------------------------------------|\n"
            )

            # Write each contributor to the table
            for contributor in contributors:
                # Split the contributor string into name and email
                parts = contributor.split(" <")
                if len(parts) == 2:
                    name = parts[0].strip()
                    email = parts[1].replace(">", "").strip()
                    # Write the row in the table
                    f.write(f"| 1             | {name:<30} | {email:<43} |\n")
                else:
                    print(f"Warning: Incorrect format for contributor: {contributor}")

        print("CONTRIBUTORS.md file updated successfully.")
    except Exception as e:
        print(f"Error updating the file: {e}")


def main() -> None:
    """
    Main function of the script.
    """
    try:
        # Fetch the list of contributors
        contributors = get_contributors()
        if contributors:
            print(f"Contributors fetched: {len(contributors)}")
            # Update the CONTRIBUTORS.md file
            update_contributors_file(contributors)
        else:
            print("No contributors found.")
    except Exception as e:
        print(f"Error running the script: {e}")


if __name__ == "__main__":
    main()
