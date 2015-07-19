# Functions for Connecting to Arduino
# and Driving the motors on Qbot
# Based on Adafruit Ardumoto shield
# Formatted QBot Style
# Mr. Michaud
# www.nebomusic.net

######### Motor Functions QBot style #########
#   -255 to 255 Range backward to stop to forward
#   Actual range:  0.0 to 1.0

# Imports
import serial
from pyfirmata import Arduino, util
from time import sleep

# Try setting up board - this will need to be adjusted based on Computer
# Below is Linux style for Raspberry Pi
# board = Arduino('/dev/ttyACM0')

# OSX Style
# board = Arduino('')

# Window Style
board = Arduino('COM33')

# PWM might be range 0.0 to 1.0 instead of 0 to 255
 
# Left Side motorB (-255 to 255)
powerB = board.get_pin('d:11:p') # PWM
dirB = board.get_pin('d:13:o') # Direction: Try 1 or 0
 
# Right Side MotorA (-255 to 255)
powerA = board.get_pin('d:3:p') # PWM
dirA = board.get_pin('d:12:o') # Direction
 
# Default Power
power = 20

# Conversion from power to PWM Input
def convertPower(power):
    pwm = (power / 255.0) * 1.0
    return pwm

# Functions for Motors: Input range of -255 to 255
 
def forward(power):
    d = 1
    if power < 0:
        d = 0
    pwm = convertPower(power)
    dirA.write(d)
    dirB.write(d)
    powerA.write(pwm)
    powerB.write(pwm)

def backward(power):
    d = 0
    if power < 0:
        d = 1
    pwm = convertPower(power)
    dirA.write(d)
    dirB.write(d)
    powerA.write(pwm)
    powerB.write(pwm)

def left(power):
    dA = 1
    dB = 0
    if power < 0:
        dA = 0
        dB = 1
    pwm = convertPower(power)
    dirA.write(dA)
    dirB.write(dB)
    powerA.write(pwm)
    powerB.write(pwm)
    
 
def right(power):
    dA = 0
    dB = 1
    if power < 0:
        dA = 1
        dB = 0
    pwm = convertPower(power)
    dirA.write(dA)
    dirB.write(dB)
    powerA.write(pwm)
    powerB.write(pwm)
 
# Functions for Servos
 
def motorA(power):
    d = 1
    if power < 0:
        d = 0
    pwm = convertPower(power)
    dirA.write(d)
    powerA.write(pwm)
 
def motorB(power):
    d = 1
    if power < 0:
        d = 0
    pwm = convertPower(power)
    dirB.write(d)
    powerB.write(pwm)
 
def stopMotors():
    dirA.write(1)
    dirB.write(1)
    powerA.write(0)
    powerB.write(0)

# Emulate the delay() function from Arduino
def delay(t):
    sleep ( t / 1000.0)

# Disconnect from serial
def done():
    board.exit()
    
