#!/bin/sh

sensors | grep temp1 | awk -F: '{ gsub(/ /,""); print $2}'
