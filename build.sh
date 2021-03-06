#!/bin/sh

set -e

render_file() {
    input_dir="$1"
    input_file="$2"

    output_dir="${input_dir}"
    mkdir -p "www/${output_dir}"

    printf "rendering src%s/%s as " "${input_dir}" "${input_file}"
    case "${input_file}" in
        *.org)
            output_file="${input_file%.org}.html"
            pandoc --standalone --from org --to html5 \
                --output="www/${output_dir}/${output_file}" \
                "src/${input_dir}/${input_file}"
            ;;
        *)
            output_file="${input_file}"
            cp "src/${input_dir}/${input_file}" "www/${output_dir}/${output_file}"
            ;;
    esac
    printf "%s\n" "www${output_dir}/${output_file}"
}

main () {
    for file in src/*.*
    do
        input_file="$(basename "${file}")"
        render_file "" "${input_file}"
    done

    for file in src/**/*.*
    do

        input_dir="$(dirname "${file}")"
        input_file="$(basename "${file}")"

        render_file "${input_dir#src}" "${input_file}"
    done
}

main
