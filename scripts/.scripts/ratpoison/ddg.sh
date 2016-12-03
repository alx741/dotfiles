#! /bin/sh

search_text=`ratpoison -c "prompt DDG>  "`
if [[ $search_text == "" ]]
then
    return 0
fi

search_results=$(ddg "$search_text" | fold -w 100)
if [[ $search_results != "" ]]
then
    ratpoison -c "echo $search_results"
fi
