//
//  ViewController.swift
//  weatherApp
//
//  Created by poonam mittal on 24/01/23.
//
// https://api.weatherapi.com/v1/current.json?key=9504cdc4040242cab8c83319232401&q=india&aqi=no
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var updateTimeLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    func fetchData(){
        
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=9504cdc4040242cab8c83319232401&q=india&aqi=no")
        
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, urlResponse, error) in
            
            guard let data = data, error == nil else {
                print("eror occured while processing the data with URL")
                return
            }
            var fullWeatherData:WeatherData?
            do {
                fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            }catch {
                print("error occured while decoding JSON into Swift Structure \(error)")
            }
            
       
            DispatchQueue.main.async {
                self.updateTimeLabel.text = "Updated : \(fullWeatherData!.current.last_updated)"
                self.regionLabel.text = "Region :  \(fullWeatherData!.location.region)"
                self.countryLabel.text = "Country : \(fullWeatherData!.location.country)"
                self.temperatureLabel.text = "Temperature (Celsius) : \(fullWeatherData!.current.temp_c)"
                self.humidityLabel.text = "Humidity : \(fullWeatherData!.current.humidity)"
                self.windLabel.text = "Wind (Km/hr) : \(fullWeatherData!.current.wind_kph)"
            }
     
        }
        dataTask.resume()
    }
  
    @IBAction func refreshData(_ sender: Any) {
        
        fetchData()
    }
    
}

