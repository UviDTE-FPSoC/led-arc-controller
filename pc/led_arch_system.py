import time
import socket
import struct
import binascii
from enum import Enum

class LedArchSystem():
    """
    This class represents a a system with several LED arches.
    It is used to configure and start sequences. 
    """

    class Response(Enum):
        """
        This enum represents the response of the system to a message.
        """
        OK = 0
        ERROR = 1
        UNKNOWN_COMMAND = 2

    def __init__(self):
        pass

    def connect(self, ip, port):
        """
        Connect to the system.

        Params:
        - ip (string): ip address of the system
        - port (int): port of the system
        """
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        try:
            self.socket.connect((ip, port))
            return True
        except:
            print("Error: could not connect to system.")
            return False

    def disconnect(self):
        """
        Disconnect from the system.
        """
        self.socket.close()

    def configure(self, config):
        """
        Configure the system.

        Params:
        - config (dict): configuration of the system

        Return:
        - success (bool): True if the configuration was successful, False otherwise
        """
        # Send global configuration
        message = self._encodeGlobalConfigurationMessage(config)
        sent = self.socket.send(message)
        if sent == 0:
            print("Error: could not send global configuration message.")
            return False 
        
        # Wait for response 
        message = self.socket.recv(1)
        if message ==  b'':
            print("Error: could not receive response message from global configuration.")
            return False
        response = self._decodeResponseMessage(message)

        # Analize response
        if response == self.Response.OK:
            print("Global configuration successful.")
        else:
            print("Error: global configuration failed. MCU did not respond with OK.")
            return False

        # Send arc configurations
        for arc in range(config["light"]["number_arcs"]):
            sent = self.socket.send(self._encodeArcConfigurationMessage(config, arc))
            if sent == 0:
                print("Error: could not send arc configuration message for arc {}.".format(arc))
                return False

            # Wait for response
            message = self.socket.recv(1)
            if message ==  b'':
                print("Error: could not receive response message from arc configuration.")
                return False

            # Analize response
            response = self._decodeResponseMessage(message)
            if response == self.Response.OK:
                print("Arc configuration successful for arc {}.".format(arc))
            else:
                print("Error: arc configuration failed for arc {}.".format(arc))
                return False

        return True

    def start_sequence(self):
        """
        Start the sequence.

        Return:
        - success (bool): True if the sequence was started successfully, False otherwise
        """
        # Send start message
        message = self._encodeStartMessage()
        sent = self.socket.send(message)
        if sent == 0:
            print("Error: could not send start message.")
            return False

        # Wait for response
        message = self.socket.recv(1)
        if message ==  b'':
            print("Error: could not receive response message from start message.")
            return False
        response = self._decodeResponseMessage(message)

        # Analize response
        if response == self.Response.OK:
            print("Start sequence successful.")
        else:
            print("Error: start sequence failed.")
            return False

        return True

    def _encodeGlobalConfigurationMessage(self, config):
        """
        Encode the global configuration from dictionary to binay message.

        Parameters:
        - config (dict): configuration of the system

        Returns:
        - message (bytearray): binary global configuration message
        """
        message = bytearray()
        message.extend(struct.pack('B', 0)) # global config command code
        if config["trigger"]["enabled"]:
            message.extend(struct.pack('B', 1)) 
        else:
            message.extend(struct.pack('B', 0))
        message.extend(struct.pack('>I', int(config["trigger"]["delay_us"]))) 
        message.extend(struct.pack('>I', int(config["trigger"]["duration_us"])))
        message.extend(struct.pack('>H', config["light"]["number_arcs"]))

        print("Size of global configuration message is " + str(len(message)) + " bytes.")
        print("Global configuration message is " + str(binascii.hexlify(message)))

        return message
    
    def _encodeArcConfigurationMessage(self, config, arc):
        """
        Encode the arc configuration from dictionary to binay message.

        Parameters:
        - config (dict): configuration of the system
        - arc (int): number of the arc to configureq (master is 0, 
          slave 1 is 1, slave 2 is 2, etc.)

        Returns:
        - message (bytearray): binary arc configuration message
        """
        message = bytearray()

        message.extend(struct.pack('B', 1)) # arc config command code
        message.extend(struct.pack('>H', arc)) # arc number
        message.extend(struct.pack('>H', int(config["light"]["number_leds"])))
        message.extend(struct.pack('>I', int(config["light"]["sequence"]["period_us"])))
        message.extend(struct.pack('>H', int(config["light"]["sequence"]["number_states"])))
        message.extend(struct.pack('>H', int(config["light"]["sequence"]["led_groups"])))
        message.extend(struct.pack('>I', int(config["light"]["sequence"]["repeat"])))

        for state in config["light"]["sequence"]["states"]:
            for intensity in state[arc]:
                message.extend(struct.pack('B', intensity))

        print("Size of arc configuration message is " + str(len(message)) + " bytes.")
        print("Arc configuration message is " + str(binascii.hexlify(message)))

        return message

    def _encodeStartMessage(self):
        """
        Encode the start message from dictionary to binay message.

        Returns:
        - message (bytearray): binary start message
        """
        message = bytearray()

        message.extend(struct.pack('B', 2)) # start sequence command code

        print("Size of start message is " + str(len(message)) + " bytes.")
        print("Start message is " + str(binascii.hexlify(message)))

        return message

    def _decodeResponseMessage(self, message):
        """
        Decode the response from the system.

        Parameters:
        - message (bytes): binary response message

        Returns:
        - response (Response enum): response from the system
        """ 
        response = struct.unpack('B', message)
        print("Response message in HEX is " + str(binascii.hexlify(message)))
        print("Response message in INT is " + str(response[0]))
        if response[0] == 0:
            return self.Response.OK
        elif response[0] == 1:
            return self.Response.ERROR
        else:
            return self.Response.UNKNOWN_COMMAND