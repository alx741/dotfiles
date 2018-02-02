#! /bin/sh

filename=$(basename "$1")
extension="${filename##*.}"
extension=$( echo "$extension" | tr '[:upper:]' '[:lower:]')

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

if is_filetype "text" "$1" && [[ "$extension" != "html" ]];
then
    vim "$@"
    exit
elif is_filetype "image" "$1";
then
    sxiv -a -q "$@"
    exit
elif is_filetype "video" "$1" || is_filetype "audio" "$1";
then
    mpv "$@"
    exit
fi

case $extension in
    pdf)
        zathura "$@"&
        ;;
    html)
        firefox "$@"
        ;;
    docx|xlsx|pptx|xls|xlw|xlt|odt|fodt|ods|fods|odp|odg|fodg|odf|fodp|swx|stw|stc|sti|sxm)
        libreoffice "$@"
        ;;
    *)
        echo
        echo "Lol Wut ¯\\_(ツ)_/¯"
        ;;
esac
