#!/bin/bash

ps auxwww | grep dccp | grep -v grep | cut -c 10-15 | xargs kill -9

