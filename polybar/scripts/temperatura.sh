#!/bin/sh

sensors | grep CPU | awk -F: '{ gsub(/ /,""); print $2}'
