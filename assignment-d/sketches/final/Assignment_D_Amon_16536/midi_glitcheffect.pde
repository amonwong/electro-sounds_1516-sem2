void midiMessage(MidiMessage message, long timestamp, String bus_name) { 
  int note = (int)(message.getMessage()[1] & 0xFF) ;
  int vel = (int)(message.getMessage()[2] & 0xFF);

  println("Bus " + bus_name + ": Note "+ note + ", vel " + vel);
  if (vel > 30 ) {
    rotateY(frameCount*0.002);
    rotateX(frameCount*0.002);
  }
}