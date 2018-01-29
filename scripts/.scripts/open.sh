#! /bin/sh

echo "$1"

filename=$(basename "$1")
extension="${filename##*.}"
extension=$( echo "$extension" | tr '[:upper:]' '[:lower:]')


case $extension in
    pdf)
        zathura "$@"&
        ;;
    html)
        firefox "$@"
        ;;
    png|jpg|gif|jpgeg)
        sxiv -a -q "$@"
        ;;
    mp3|mpg|mpeg|mp4|webm|flv|wav)
        mpv "$@"
        ;;
    docx|xlsx|pptx|xls|xlw|xlt|odt|fodt|ods|fods|odp|odg|fodg|odf|fodp|swx|stw|stc|sti|sxm)
        libreoffice "$@"
        ;;
    md|txt|csv|conf|sh)
        vim "$@"
        ;;
    *)
        echo "WAT"
        ;;
esac
