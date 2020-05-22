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

                if let dateString = dictionary["date"] as? String,
                    let explanation = dictionary["explanation"] as? String,
                    let urlString = dictionary["url"] as? String,
                    let title = dictionary["title"] as? String {
                    guard let date = dateFormatter.date(from: dateString) else { return }
                    let imageURL = URL(string: urlString)!
                    let pictureOD = Pod(date: date, explanation: explanation, imageURL: imageURL, title: title)
                    self.photos.append(pictureOD)
                }
            } catch {
                NSLog("Error fetching photo from JSON: \(error)")
                completion(error)
                return
            }

            completion(nil)
        }.resume()
    }
}
