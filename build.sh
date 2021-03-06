#!/bin/sh

set -e

for file in src/**/*
do

    input_dir="$(dirname "${file}")"
    input_file="$(basename "${file}")"

    printf "rendering %s/%s as " "${input_dir}" "${input_file}"

    output_dir="www/${input_dir#src/}"
    mkdir -p "${output_dir}"

    case "${input_file}" in
        *.org)
            output_file="${input_file%.org}.html"
            pandoc --standalone --from org --to html5 --output="${output_dir}/${output_file}" "${file}"
            printf "%s" "${output_dir}/${output_file}"
            ;;
        *)
            output_file="${input_file}"
            cp "${input_dir}/${input_file}" "${output_dir}/${output_file}"
            printf "%s" "${output_dir}/${output_file}"
            ;;
    esac

    printf "\n"
done
