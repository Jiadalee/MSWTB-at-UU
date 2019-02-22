

/* Test version 2, with volume measurement
 *  
 *  
*/



byte sensorInterrupt = 0;  // 0 = digital pin 2


// The hall-effect flow sensor outputs approximately 4.5 pulses per second per
// litre/minute of flow.
float calibrationFactor = 6.35;

volatile byte pulseCount;  

float flowRate;
unsigned int flowMilliLitres;
unsigned long totalMilliLitres;

unsigned long countTime;

void setup()
{
  
  // Initialize a serial connection for reporting values to the host
  Serial.begin(38400);
  Serial.print("Flow rate, Current Flow, Water Volum");
  pulseCount        = 0;
  flowRate          = 0.0;
  flowMilliLitres   = 0;
  totalMilliLitres  = 0;
  countTime           = 0;

  // The Hall-effect sensor is connected to pin 2 which uses interrupt 0.
  // Configured to trigger on a FALLING state change (transition from HIGH
  // state to LOW state)
  attachInterrupt(sensorInterrupt, pulseCounter, FALLING);
}


// write the data


/**
 * Main program loop
 */
void loop()
{
   
   if((millis() - countTime) > 1000)    // Only process counters once per second
  { 

    detachInterrupt(sensorInterrupt);
        

    flowRate = ((1000.0 / (millis() - countTime)) * pulseCount) / calibrationFactor;
    

    countTime = millis();
    

    flowMilliLitres = (flowRate / 60) * 1000;
    
    // The millilitres passed in this second to the cumulative total
    totalMilliLitres += flowMilliLitres;
      
    unsigned int frac;
    
    // Print the flow rate for this second in litres / minute
  
    Serial.print(int(flowRate));  // Print the integer part of the variable
    Serial.print(".");             // Print the decimal point
    // Determine the fractional part. The 10 multiplier gives us 1 decimal place.
    frac = (flowRate - int(flowRate)) * 10;
    Serial.print(frac, DEC) ;      // Print the fractional part of the variable
    Serial.print("L/min       ,");
    // Print the number of litres flowed in this second

    Serial.print(flowMilliLitres);
    Serial.print("mL/S    ,");

    // Print the cumulative total of litres flowed since starting

    Serial.print(totalMilliLitres);
    Serial.println("mL"); 

    // Reset the pulse counter so we can start incrementing again
    pulseCount = 0;
    
    // Enable the interrupt again now that we've finished sending output
    attachInterrupt(sensorInterrupt, pulseCounter, FALLING);
  }
}

/*
Insterrupt Service Routine
 */
void pulseCounter()
{
  // Increment the pulse counter
  pulseCount++;
}
