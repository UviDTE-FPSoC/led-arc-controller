from led_arch_system import LedArchSystem
from yamldict import YamlDict

import sys

def Usage(argv):
    print("Help")
    print("----")
    print("Connect to the socket server in MCU, configure, and run the sequence.")
    print("----")
    print("Usage:")
    print(argv[0] + " <server ip address> <server port> <yaml config file>")
    print("Example:")
    print(argv[0] + " 192.168.1.30 5000 config/config.yaml")

if __name__ == '__main__':

    # Get arguments
    if len(sys.argv)!=4:
        Usage(sys.argv)
        exit()
    ip = sys.argv[1]
    port = sys.argv[2]
    config_file = sys.argv[3]

    # Load config yaml into dictionary
    config = YamlDict(config_file)

    # Connect to the led system
    print("Connecting to system with ip: " + ip + " and port: " + port +"")
    leds = LedArchSystem()
    connected = leds.connect(ip, int(port))
    if not connected:
        print("Connection failed.")
        exit(1)

    # Configure the system
    print("Configuring system...")
    success = leds.configure(config)
    if not success:
        print("Configuration failed.")
        exit(1)

    # Run the sequence
    print("Running sequence...")
    success = leds.start_sequence()
    if not success:
        print("Sequence failed.")
        exit(1)
    else:
        print("Sequence started correctly")

    # Disconnect from the system
    leds.disconnect()    