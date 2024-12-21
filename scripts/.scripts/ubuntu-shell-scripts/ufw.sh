#!/usr/bin/env bash

ufw status

ufw allow 'OpenSSH' 'Apache Full'

ufw enable

ufw reload

ufw status numbered
