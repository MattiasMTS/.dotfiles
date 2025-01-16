#!/usr/bin/env python3

import re
import sys

_TEST_PATTERN = re.compile(
    r"(\{% call dbt_unit_testing\.test.*.*?\{% endcall %\})",
    re.DOTALL,
)
_MOCK_PATTERN = re.compile(
    r"(\{% call dbt_unit_testing\.(mock_ref|mock_source|expect).*?\{% endcall %\})",
    re.DOTALL,
)

_SEPARATOR = "|"


def _format_table(table_string: str) -> str:
    output_separator = f" {_SEPARATOR} "

    if _SEPARATOR not in table_string:
        return table_string

    lines = table_string.strip().split("\n")
    indent = max(len(line) - len(line.lstrip()) for line in lines)

    header_index, header_line = _return_header_line(lines)

    headers = [header.strip() for header in header_line.split(_SEPARATOR)]
    rows = [
        [cell.strip() for cell in line.split(_SEPARATOR)]
        for line in lines[header_index + 1 :]
    ]

    col_widths = [
        max(len(header), *(len(row[i]) if len(row) > 1 else 0 for row in rows))
        for i, header in enumerate(headers)
    ]

    # else statement to fix when the last column's value is large in width
    # compared to the header...
    formatted_headers = output_separator.join(
        header.ljust(col_widths[i]) if i != len(headers) - 1 else header
        for i, header in enumerate(headers)
    )
    formatted_rows = [
        (
            output_separator.join(
                row[i].ljust(col_widths[i]) for i in range(len(headers))
            )
            if len(row) > 1
            else row[0]
        )
        for row in rows
    ]

    formatted_lines = ["\n" + " " * indent + formatted_headers] + [
        f"{' ' * indent}{line.strip()}" for line in formatted_rows
    ]

    lines_before_header = "\n".join(lines[0:header_index])
    return lines_before_header + "\n".join(formatted_lines)


def _return_header_line(lines):
    for i, line in enumerate(lines):
        if _SEPARATOR in line:
            return i, line
    return None


def _format_tables(match: re.Match) -> str:
    block = match.group(0)
    table_match = re.search(
        r"(\n\s*.*?)(?=\n\s*\{% endcall %\})", block, re.DOTALL
    )
    if table_match:
        table = table_match.group(1)
        formatted_table = _format_table(table)
        return block.replace(table, formatted_table)
    return block


def _format_test_blocks(match: re.Match) -> str:
    block = match.group(0)
    return _MOCK_PATTERN.sub(_format_tables, block)


def process_file(file_path: str) -> None:
    with open(file_path, "r") as file:
        content = file.read()

    formatted_content = _TEST_PATTERN.sub(_format_test_blocks, content)

    if content == formatted_content:
        print(f"Skipped '{file_path}'")
        return

    if content != formatted_content:
        print(f"Formatted '{file_path}'")

    with open(file_path, "w") as file:
        file.write(formatted_content)


def main():
    NOT_OK, NO_FILE_PROVIDED_ERROR = 1, 2
    if len(sys.argv) < NO_FILE_PROVIDED_ERROR:
        return NOT_OK
    file = sys.argv[1:]
    process_file(file[0])


if __name__ == "__main__":
    sys.exit(main())
