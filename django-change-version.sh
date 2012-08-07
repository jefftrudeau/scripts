#!/bin/bash
#
# Script to quickly change between multiple versions of Django.
#
# Copyright (C) Jeff Trudeau

django_dir=/home/jeff/django
site_packages=/usr/lib/python2.7/site-packages

echo "The following versions of Django are available:"
for django in `ls $django_dir`; do
  echo "  $django"
done
read -p "Please choose which version to set as active: " choice

django_dir="$django_dir/$choice"
if [ -d "$django_dir" ]; then
  echo "$django_dir" | sudo tee "$site_packages"/django.pth
  sudo ln -sf "$django_dir"/django/bin/django-admin.py /usr/local/bin/django-admin.py
else
  echo "Invalid choice, exiting."
fi
