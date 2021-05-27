//
//  ContentView.swift
//  Weather
//
//  Created by Sunil on 27/5/21.
//

import SwiftUI

enum Day: String {
    case TUE
    case WED
    case THU
    case FRI
    case SAT
}

enum WeatherImageName: String {
    case CloudSunfill = "cloud.sun.fill"
    case CloudSunBoltFill =  "cloud.sun.bolt.fill"
    case CloudSunRainFill = "cloud.sun.rain.fill"
}

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            
            VStack {
                CityTextView(cityName: "Sydney, SYD")

                MainWeatherStatusView(imageName: isNight ? "moon.circle.fill" : "cloud.sun.fill", temperature: isNight ? 8 : 15)

                HStack(spacing: 16) {
                    WeatherDayView(dayOfWeek: Day.TUE.rawValue, imageName: WeatherImageName.CloudSunfill.rawValue,
                                   temperature: 28)
                    WeatherDayView(dayOfWeek: Day.WED.rawValue, imageName: WeatherImageName.CloudSunBoltFill.rawValue,
                                   temperature: 12)
                    WeatherDayView(dayOfWeek: Day.THU.rawValue, imageName: WeatherImageName.CloudSunBoltFill.rawValue,
                                   temperature: 12)
                    WeatherDayView(dayOfWeek: Day.FRI.rawValue, imageName: WeatherImageName.CloudSunRainFill.rawValue,
                                   temperature: 8)
                    WeatherDayView(dayOfWeek: Day.SAT.rawValue, imageName: WeatherImageName.CloudSunRainFill.rawValue,
                                   temperature: 9)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {

    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 40, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {

    var topColor: Color
    var bottomColor: Color

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String

    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 40, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
