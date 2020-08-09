#!/bin/sh

render_file() {
    current_dir="${1}"
    page="${2}"
    header=$(cat "${current_dir}"/header.html)
    body=$(pandoc --from org --to html5 "${page}")
    footer=$(cat "${current_dir}"/footer.html)

    output_dir="./www/${current_dir#./src/txt/}"
    output_filepath="./www/${page#./src/txt/}"
    output_filepath="${output_filepath%.org}.html"

    mkdir -p "${output_dir}"
    printf "%s\n%s\n%s" "${header}" "${body}" "${footer}" > "${output_filepath}"
}

render_dir() {
    current_dir="${1}"
    for page in "${current_dir}"*.org
    do
        render_file "${current_dir}" "${page}"
    done
}

render_html() {
    render_dir ./src/txt/
    for dir in ./src/txt/**/
    do
        render_dir "${dir}"
    done
}

copy_statics() {
    mkdir -p ./www
    cp -R ./src/css ./www
    cp -R ./src/img ./www
}

clean() {
    rm -rf www
}

main() {
    clean
    render_html
    copy_statics
}

main
