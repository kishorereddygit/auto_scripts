#!/bin/bash
mv buildPi ~
cd ..
cd buildPi
. install_dependencies.sh 
. setting_up.sh 
. build_zip_for_pi.sh
