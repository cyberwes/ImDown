//
//  LocationAttempt.swift
//  ImDown
//
//  Created by Rahul Ramachandran on 22/11/2023.
//

import SwiftUI
import CoreLocation

struct LocationAttempt: View {
    @State private var location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.5407, longitude: -77.4360)
    @State private var locationName: String = ""

    var body: some View {
        VStack {
            Text("Location Name: \(locationName)")

            Button("Get Location Name") {
                reverseGeocode()
            }
            .padding()
        }
    }

    func reverseGeocode() {
        let geocoder = CLGeocoder()

        let locationToGeocode = CLLocation(latitude: location.latitude, longitude: location.longitude)

        geocoder.reverseGeocodeLocation(locationToGeocode) { placemarks, error in
            if let error = error {
                print("Reverse geocoding failed with error: \(error.localizedDescription)")
                return
            }
            if let placemark = placemarks?.first {
                // Access placemark properties as needed
                if let name = placemark.name,
                   let cityL = placemark.locality,
                   let locationName = placemark.location,
                   let street = placemark.thoroughfare,
                   let city = placemark.subAdministrativeArea,
                   let state = placemark.administrativeArea {
                    self.locationName = "\(name), \(city), \(state),\(cityL),\(locationName),\(street)"
                } else {
                    self.locationName = "Location name not available"
                }
            } else {
                self.locationName = "No placemarks found"
            }
        }
    }
}

#Preview {
    LocationAttempt()
}
