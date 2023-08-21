#!/bin/bash
cd /usr/src/app

######################### START of line patch ############################
patch -p1 --forward < src/patches/intermitten-shipping-method.patch || true
patch -p1 --forward < src/patches/update-generate-config.patch || true

######################### END of line patch ##############################
