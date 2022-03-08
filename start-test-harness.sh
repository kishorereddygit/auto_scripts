#!/bin/bash

cd /home/ubuntu/chip-certification-tool
bash scripts/start.sh
echo -ne '\n'
echo -ne '>>>                       [20%]\r'
# some task
sleep 20
echo -ne '>>>>>>>                   [40%]\r'
# some task
sleep 30
echo -ne '>>>>>>>>>>>>>>            [60%]\r'
# some task
sleep 40
echo -ne '>>>>>>>>>>>>>>>>>>>>>>>   [80%]\r'
# some task
sleep 50
echo -ne '>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\r'
sleep 20
echo -ne '....Progress Complete....\r'
sleep 10 
echo -ne '\n'
