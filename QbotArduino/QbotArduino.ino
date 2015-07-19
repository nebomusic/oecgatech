// QBot test code - API Library for QBot
// Mr. Michaud
// www.nebomusic.net

void setup() {
  setupQBot();

}

void loop() {
  // put your main code here, to run repeatedly:

}


//////////// Code for QBot: Do not modify Below Here! ///////////////

// Define motors and Direction Pins
int dirA = 12;
int dirB = 13;
int powerA = 3;
int powerB = 11;

void setupQBot() {
    // put your setup code here, to run once:
    pinMode(dirA, OUTPUT);
    pinMode(dirB, OUTPUT);
    pinMode(powerA, OUTPUT);
    pinMode(powerB, OUTPUT);
}

void forward(int power, int t) {
  int d = HIGH;
  if (power < 0) {
    d = LOW;
  }
  digitalWrite(dirA, d);
  digitalWrite(dirB, d);
  analogWrite(powerA, power);
  analogWrite(powerB, power);
  delay(t);
  analogWrite(powerA, 0);
  analogWrite(powerB, 0);
}

void forward(int power) {
  int d = HIGH;
  if (power < 0) {
    d = LOW;
  }
  digitalWrite(dirA, d);
  digitalWrite(dirB, d);
  analogWrite(powerA, power);
  analogWrite(powerB, power);
}

void backward(int power, int t) {
  int d = LOW;
  if (power < 0) {
    d = HIGH;
  }
  digitalWrite(dirA, d);
  digitalWrite(dirB, d);
  analogWrite(powerA, power);
  analogWrite(powerB, power);
  delay(t);
  analogWrite(powerA, 0);
  analogWrite(powerB, 0);
}

void backward(int power) {
  int d = LOW;
  if (power < 0) {
    d = HIGH;
  }
  digitalWrite(dirA, d);
  digitalWrite(dirB, d);
  analogWrite(powerA, power);
  analogWrite(powerB, power);
}

void right(int power, int t) {
  int dA = LOW;
  int dB = HIGH;
  if (power < 0) {
    dA = HIGH;
    dB = LOW;
  }
  digitalWrite(dirA, dA);
  digitalWrite(dirB, dB);
  analogWrite(powerA, power);
  analogWrite(powerB, power);
  delay(t);
  analogWrite(powerA, 0);
  analogWrite(powerB, 0);
}

void right(int power) {
  int dA = LOW;
  int dB = HIGH;
  if (power < 0) {
    dA = HIGH;
    dB = LOW;
  }
  digitalWrite(dirA, dA);
  digitalWrite(dirB, dB);
  analogWrite(powerA, power);
  analogWrite(powerB, power);
}

void left(int power, int t) {
  int dA = HIGH;
  int dB = LOW;
  if (power < 0) {
    dA = LOW;
    dB = HIGH;
  }
  digitalWrite(dirA, dA);
  digitalWrite(dirB, dB);
  analogWrite(powerA, power);
  analogWrite(powerB, power);
  delay(t);
  analogWrite(powerA, 0);
  analogWrite(powerB, 0);
}

void left(int power) {
  int dA = HIGH;
  int dB = LOW;
  if (power < 0) {
    dA = LOW;
    dB = HIGH;
  }
  digitalWrite(dirA, dA);
  digitalWrite(dirB, dB);
  analogWrite(powerA, power);
  analogWrite(powerB, power);
}

void motorA(int power, int t) {
  int d = HIGH;
  if (power < 0) {
    d = LOW;
    power = power * -1;
  }
  digitalWrite(dirA, d);
  analogWrite(powerA, power);
  delay(t);
  analogWrite(powerA, 0);
}

void motorA(int power) {
  int d = HIGH;
  if (power < 0) {
    d = LOW;
    power = power * -1;
  }
  digitalWrite(dirA, d);
  analogWrite(powerA, power);
}

void motorB(int power, int t) {
  int d = HIGH;
  if (power < 0) {
    d = LOW;
    power = power * -1;
  }
  digitalWrite(dirB, d);
  analogWrite(powerB, power);
  delay(t);
  analogWrite(powerB, 0);
}

void motorB(int power) {
  int d = HIGH;
  if (power < 0) {
    d = LOW;
    power = power * -1;
  }
  digitalWrite(dirB, d);
  analogWrite(powerB, power);
}

void stopMotors(){
  forward(0);
}


  



    


