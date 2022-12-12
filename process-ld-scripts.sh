#!/bin/sh

# Add C-style comment around the block
#  /DISCARD/ : {
#    .....
#  }
sed -i '/\/DISCARD\/ : {/,/}/ {
  /DIS/ i/*
  /}/ a*/
}' */rpi32.ld
