#!/bin/sh
useradd -m admin -p $(perl -e "print crypt('changethispassword','sa');")

