#! /bin/sh

filename=$(basename "$1")
extension="${filename##*.}"
extension=$( echo "$extension" | tr '[:upper:]' '[:lower:]')


case $extension in
    pdf)
        zathura $@
        ;;
    html)
        firefox $@
        ;;
    png|jpg|gif|jpgeg)
        sxiv $@
        ;;
    mp3|mpg|mpeg|mp4|webm|flv|wav)
        sxiv $@
        ;;
    docx|xlsx|pptx|xls|xlw|xlt|odt|fodt|ods|fods|odp|odg|fodg|odf|fodp|swx|stw|stc|sti|sxm)
        libreoffice $@
        ;;
    *)
        echo "WAT"
        ;;
esac
