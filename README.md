# led-arc-controller

MCU and PC code for controlling multiple LED arches

## Python program for PC

This program is a Socket client that connects to the MCU and:
 - Transforms YAML file with LED arc configuration to binary message.
 - Sends configuration message to arches. 
 - Sends message to start the sequence.

#### Dependencies 

Install Python 3.8 or superior.

#### How to run 

First run the MCU server or fake server that simulates the MCU in PC:

```
python fake_mcu_server.py
```

Then run the client to configure the LED arc system and launch a sequence.

```
python configure_and_run.py
```




