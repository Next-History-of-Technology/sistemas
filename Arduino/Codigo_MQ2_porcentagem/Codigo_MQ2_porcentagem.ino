// Bloco 1
const int PINO_SENSOR_MQ2 = A0;

const int VALOR_MINIMO = 100;
const int VALOR_MAXIMO = 1000;



// Bloco 2
void setup() {
  Serial.begin(9600);
}



// Bloco 3

void loop() {
  int valorSensor = analogRead(PINO_SENSOR_MQ2);

  float porcentagem = ((float)(valorSensor - VALOR_MINIMO) / (VALOR_MAXIMO - VALOR_MINIMO)) * 100;

  if(porcentagem < 0) {
    porcentagem = 0;
  } else if (porcentagem > 100) {
    porcentagem = 100;
  }

  Serial.print("Alta:");
  Serial.print(80);
  Serial.print(" ");
  Serial.print("Média:");
  Serial.print(50);
  Serial.print(" ");
  Serial.print("Concentração:");
  Serial.print(porcentagem);
  Serial.print(" ");
  Serial.print("Baixa:");
  Serial.println(15);


  delay(2000);
}
