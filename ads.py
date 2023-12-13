from signal import signal, SIGTERM, SIGHUP, pause
from smbus import SMBus
from gpiozero import PWMLED
from time import sleep
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import bluetooth
import struct
import time

bus = SMBus(1)
led = PWMLED(26)


def bluez_connect(sock):
    server_address = "D8:3A:DD:32:90:64"
    port = 1
    sock.connect((server_address, port))

def safe_exit(signum, frame):
    exit(1)

ads7830_commands = [0x84, 0xc4, 0x94, 0xd4, 0xa4, 0xe4, 0xb4, 0xf4]
def read_ads7830(input):
    bus.write_byte(0x4b, ads7830_commands[input])
    return bus.read_byte(0x4b)

def values(input, sock):
    buffer_byte = b''
    c = 0
    print('Start sensing')
    while True:
        value = read_ads7830(input)
        value_byte = struct.pack('B', value)
        buffer_byte += value_byte

        timestamp = int(time.time() * 1000)  # ms precision
        time_bytes = struct.pack('q', timestamp)
        buffer_byte += time_bytes

        c += 1

        if len(buffer_byte) > 50:
            sock.send(buffer_byte)
            buffer_byte = b''
            print(c, 'values sent.')
            c = 0
            
        sleep(0.02)

signal(SIGTERM, safe_exit)
signal(SIGHUP, safe_exit)

while True:
    sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
    try:
        print('try to connect to bluetooth server')
        bluez_connect(sock)
    except bluetooth.btcommon.BluetoothError as e:
        print(e)
        print('connection failed, try again')
        sock.close()
        sleep(1)
        continue
    try:
        values(0, sock)
    except bluetooth.btcommon.BluetoothError as e:
        print(e)
        print('connection failed, try again')
        sock.close()
        sleep(1)
        continue
    except KeyboardInterrupt:
        led.value = 0
        sock.close()
        break