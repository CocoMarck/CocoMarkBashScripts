#!/bin/bash
del_space_in_text () {
    text=$(echo $1 | tr "[:space:]" "\b")
    echo $text
}