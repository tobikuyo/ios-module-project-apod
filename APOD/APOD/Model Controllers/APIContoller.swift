//
//  APIContoller.swift
//  APOD
//
//  Created by Tobi Kuyoro on 22/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import Foundation

class APIController {

    let apiKey = "K9mPOWxqY0SOSRygVBgkgCLnXD253srhYwDgmVRV"
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    var photos: [Pod] = []

    func fetchPodForDate(_ date: Date, completion: @escaping (Error?) -> Void) {
        let keyQuery = URLQueryItem(name: "api_key", value: apiKey)
        let dateQuery = URLQueryItem(name: "date", value: date.description)
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [keyQuery, dateQuery]

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd"

        guard let requestURL = urlComponents?.url else { return }

        URLSession.shared.dataTask(with: requestURL) { data, _, error in
            if let error = error {
                NSLog("Error requesting photo: \(error)")
                completion(error)
                return
            }

            guard let data = data else {
                completion(NSError())
                return
            }

            do {
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                let pictureOD = Pod(dictionary: dictionary)
                self.photos.append(pictureOD)
            } catch {
                NSLog("Error fetching photo from JSON: \(error)")
                completion(error)
                return
            }

            completion(nil)
        }.resume()
    }
}
