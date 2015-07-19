// Test for hand tracking and QBot
// To be used for OEC Camps 2015
// Mr. Michaud
// www.nebomusic.net

import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import processing.serial.*;
import cc.arduino.*;

Capture video;
OpenCV opencv;

// No Arduino for now
Arduino arduino;


int dirA = 12; 
int dirB = 13;
int powerA = 3;
int powerB = 11;

void handTurn(int x) {
  // 120 is the center - range is 0 to 240
  float fx = x;
  float speed = ((fx/240) * 510) - 255;
  int dA = 0;
  int dB = 1;
  if (speed < 0) {
    dA = 1;
    dB = 0;
    speed = speed * -1;
  }
  right(int(speed));
  // arduino.digitalWrite(dirA, dA);
  // arduino.digitalWrite(dirB, dB);
  // arduino.analogWrite(powerA, int(speed));
  // arduino.analogWrite(powerB, int(speed));
}


void setup() {
  size(640, 480);
  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[1], 57600);
  // Attach Pins
  arduino.pinMode(dirA, Arduino.OUTPUT); // Attach Servo Pins
  arduino.pinMode(dirB, Arduino.OUTPUT); // Attach Servo Pins
  arduino.pinMode(powerA, Arduino.OUTPUT);
  arduino.pinMode(powerB, Arduino.OUTPUT);
  // Setup Video
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  // opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  // print (OpenCV.CASCADE_FRONTALFACE);
  opencv.loadCascade("haarcascade_hand.xml"); 

  video.start();
  
}

void draw() {
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] hands = opencv.detect(); // Detects Faces and places in Array
  println(hands.length);


  for (int i = 0; i < hands.length; i++) {
    println(hands[i].x + "," + hands[i].y);
    rect(hands[i].x, hands[i].y, hands[i].width, hands[i].height);
  }
  
  if (hands.length > 0) {
    float centerX = hands[0].x + hands[0].width/2;
    float centerY = hands[0].y + hands[0].height/2;
    ellipse(centerX, centerY, hands[0].width/8, hands[0].width/8);
    handTurn(hands[0].x);
  }
  else {
    stopMotors();
  }
  
}

void captureEvent(Capture c) {
  c.read();
}

void forward(int power, int t) {
  int d = arduino.HIGH;
  if (power < 0) {
    d = arduino.LOW;
  }
  arduino.digitalWrite(dirA, d);
  arduino.digitalWrite(dirB, d);
  arduino.analogWrite(powerA, power);
  arduino.analogWrite(powerB, power);
  delay(t);
  arduino.analogWrite(powerA, 0);
  arduino.analogWrite(powerB, 0);
}

void forward(int power) {
  int d = arduino.HIGH;
  if (power < 0) {
    d = arduino.LOW;
  }
  arduino.digitalWrite(dirA, d);
  arduino.digitalWrite(dirB, d);
  arduino.analogWrite(powerA, power);
  arduino.analogWrite(powerB, power);
}

void backward(int power, int t) {
  int d = arduino.LOW;
  if (power < 0) {
    d = arduino.HIGH;
  }
  arduino.digitalWrite(dirA, d);
  arduino.digitalWrite(dirB, d);
  arduino.analogWrite(powerA, power);
  arduino.analogWrite(powerB, power);
  delay(t);
  arduino.analogWrite(powerA, 0);
  arduino.analogWrite(powerB, 0);
}

void backward(int power) {
  int d = arduino.LOW;
  if (power < 0) {
    d = arduino.HIGH;
  }
  arduino.digitalWrite(dirA, d);
  arduino.digitalWrite(dirB, d);
  arduino.analogWrite(powerA, power);
  arduino.analogWrite(powerB, power);
}

void right(int power, int t) {
  int dA = arduino.LOW;
  int dB = arduino.HIGH;
  if (power < 0) {
    dA = arduino.HIGH;
    dB = arduino.LOW;
  }
  arduino.digitalWrite(dirA, dA);
  arduino.digitalWrite(dirB, dB);
  arduino.analogWrite(powerA, power);
  arduino.analogWrite(powerB, power);
  delay(t);
  arduino.analogWrite(powerA, 0);
  arduino.analogWrite(powerB, 0);
}

void right(int power) {
  int dA = arduino.LOW;
  int dB = arduino.HIGH;
  if (power < 0) {
    dA = arduino.HIGH;
    dB = arduino.LOW;
  }
  arduino.digitalWrite(dirA, dA);
  arduino.digitalWrite(dirB, dB);
  arduino.analogWrite(powerA, power);
  arduino.analogWrite(powerB, power);
}

void left(int power, int t) {
  int dA = arduino.HIGH;
  int dB = arduino.LOW;
  if (power < 0) {
    dA = arduino.LOW;
    dB = arduino.HIGH;
  }
  arduino.digitalWrite(dirA, dA);
  arduino.digitalWrite(dirB, dB);
  arduino.analogWrite(powerA, power);
  arduino.analogWrite(powerB, power);
  delay(t);
  arduino.analogWrite(powerA, 0);
  arduino.analogWrite(powerB, 0);
}

void left(int power) {
  int dA = arduino.HIGH;
  int dB = arduino.LOW;
  if (power < 0) {
    dA = arduino.LOW;
    dB = arduino.HIGH;
  }
  arduino.digitalWrite(dirA, dA);
  arduino.digitalWrite(dirB, dB);
  arduino.analogWrite(powerA, power);
  arduino.analogWrite(powerB, power);
}

void motorA(int power, int t) {
  int d = arduino.HIGH;
  if (power < 0) {
    d = arduino.LOW;
    power = power * -1;
  }
  arduino.digitalWrite(dirA, d);
  arduino.analogWrite(powerA, power);
  delay(t);
  arduino.analogWrite(powerA, 0);
}

void motorA(int power) {
  int d = arduino.HIGH;
  if (power < 0) {
    d = arduino.LOW;
    power = power * -1;
  }
  arduino.digitalWrite(dirA, d);
  arduino.analogWrite(powerA, power);
}

void motorB(int power, int t) {
  int d = arduino.HIGH;
  if (power < 0) {
    d = arduino.LOW;
    power = power * -1;
  }
  arduino.digitalWrite(dirB, d);
  arduino.analogWrite(powerB, power);
  delay(t);
  arduino.analogWrite(powerB, 0);
}

void motorB(int power) {
  int d = arduino.HIGH;
  if (power < 0) {
    d = arduino.LOW;
    power = power * -1;
  }
  arduino.digitalWrite(dirB, d);
  arduino.analogWrite(powerB, power);
}

void stopMotors(){
  forward(0);
}


