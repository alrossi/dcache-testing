#!/bin/bash

echo `date` >> batch.log

jobsub_q --user=arossi | grep "@" | grep R | wc -l  >> batch.log

echo "___________________________________________" >> batch.log

