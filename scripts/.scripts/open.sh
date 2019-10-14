#! /bin/sh

function is_filetype
{
    mime=`file --mime-type "$2" | cut -d':' -f 2 | tr -d " " | cut -d'/' -f 1`

    if [[ "$mime" == "$1" ]];
    then
        return 0
    else
        return 1
    fi
}


file=""
if [[ -f "$1" ]];
then
    file="$1"
else
    file=$(find . -maxdepth 1 -type f -not -path '*/\.*' -printf "%P\n"\
        | command grep -i -v -e '\.hi' -e '\.o' -e '\.elf' -e '\.hex' -e '\.d' \
        | fzf -q "$1" -1 -0)
fi

filename=$(basename "$file")
extension="${filename##*.}"
extension=$( echo "$extension" | tr '[:upper:]' '[:lower:]')

case $extension in
    pdf|epub)
        zathura "$file"&
        ;;
    html)
        firefox "$file"
        ;;
    docx|xlsx|pptx|xls|xlw|xlt|odt|fodt|ods|fods|odp|odg|fodg|odf|fodp|swx|stw|stc|sti|sxm|docm)
        libreoffice "$file"&
        ;;
    svg)
        inkscape "$file"&
        ;;
    dxf)
        librecad "$file"&
        ;;
    *)
        if is_filetype "text" "$file" && [[ "$extension" != "html" ]];
        then
            vim "$file"
            exit
        elif is_filetype "image" "$file";
        then
            sxiv -a -q "$file"&
            exit
        elif is_filetype "video" "$file" || is_filetype "audio" "$file";
        then
            mpv "$file"
            exit
        else
            echo
            echo "Lol Wut ¯\\_(ツ)_/¯"
        fi
        ;;
esac
