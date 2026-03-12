import 'package:weather/weather.dart';

Future<Weather> buscarClima(String cidade) async {
  String apiKey = '163b5c4fcc89d22d1f6917d02cfc2238'; 

  WeatherFactory wf = WeatherFactory(apiKey, language: Language.PORTUGUESE_BRAZIL);

  Weather clima = await wf.currentWeatherByCityName(cidade);
  
  return clima;
}
void main() async {
  try {

    String cidadeDesejada = 'Joinville'; 
    print('Buscando previsão do tempo em tempo real para $cidadeDesejada...');
    
    Weather climaAtual = await buscarClima(cidadeDesejada);
    
    print('\n--- Previsão Atual ---');
    print('Cidade: ${climaAtual.areaName}');
    print('Temperatura: ${climaAtual.temperature?.celsius?.toStringAsFixed(1)}°C');
    print('Condição: ${climaAtual.weatherDescription}');
    print('Sensação Térmica: ${climaAtual.tempFeelsLike?.celsius?.toStringAsFixed(1)}°C');
    
  } catch (erro) {
    print('\nErro ao buscar o clima: $erro');
    print('Dica: Verifique se você colocou uma chave de API válida no código.');
  }
}