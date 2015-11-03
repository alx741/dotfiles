#! /bin/sh


function add_task()
{
    task=`ratpoison -c "prompt Add task: "`
    if [[ "$task" == " " ]] || [[ "$task" == "" ]]; then exit 0; fi

    task add $task

    if [[ $? -ne 0 ]]
    then
        ratpoison -c "echo [!] Bad syntax"
        exit 1
    fi
}



case "$1" in
    'list')
        ratpoison -c "echo `task list`"
        ;;
    'list_projects')
        ratpoison -c "echo `task projects`"
        ;;
    'add')
        add_task
        ;;
esac
