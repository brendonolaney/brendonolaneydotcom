#!/bin/sh

set -e

render_file() {
    input_dir="$1"
    input_file="$2"

    output_dir="www${input_dir#src/site}"
    mkdir -p "${output_dir}"

    printf "rendering %s/%s as " "${input_dir}" "${input_file}"
    case "${input_file}" in
        *.org)
            output_file="${input_file%.org}.html"
            pandoc --from org --to html5 \
                --template="src/template.html" \
                --output="${output_dir}/${output_file}" \
                "${input_dir}/${input_file}"
            ;;
        *)
            output_file="${input_file}"
            cp "${input_dir}/${input_file}" "${output_dir}/${output_file}"
            ;;
    esac
    printf "%s\n" "${output_dir}/${output_file}"
}

main () {
    for file in src/site/*.*
    do
        input_file="$(basename "${file}")"

        render_file "src/site" "${input_file}"
    done

    for file in src/site/**/*.*
    do
        input_dir="$(dirname "${file}")"
        input_file="$(basename "${file}")"

        render_file "${input_dir}" "${input_file}"
    done
}

main
