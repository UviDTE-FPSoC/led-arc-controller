# echo-server.py

import socket
import struct

HOST = "127.0.0.1"  # Standard loopback interface address (localhost)
PORT = 65432  # Port to listen on (non-privileged ports are > 1023)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    print("Binded to Host " + HOST + " and Port " + str(PORT))
    s.listen()
    print("Listening...")
    conn, addr = s.accept()
    with conn:
        print(f"Connected by {addr}")
        while True:
            data = conn.recv(1024)
            if not data:
                break
            print:("Received data: ")
            print(data)
            response = struct.pack('B', 0)
            print("Sending response: ")
            print(response)
            conn.sendall(response)

            

    

