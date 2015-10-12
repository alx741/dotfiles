#! /bin/sh


case "$1" in
    'list')
        ratpoison -c "echo `task list`"
        ;;
    'list_projects')
        ratpoison -c "echo `task projects`"
        ;;
esac
