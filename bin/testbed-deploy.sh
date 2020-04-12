#!/bin/bash

`testbed-uninstall.sh $@`
`testbed-install.sh $@`
`deploy-config.sh $@`
