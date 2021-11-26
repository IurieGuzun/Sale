//
//  DownloadImage.swift
//  Sale
//
//  Created by Iurie Guzun on 2021-11-26.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import Foundation

class DownloadImage {
    private init() {}
    static let shared = DownloadImage()
    
    func getImage(with urlString: String, completion: @escaping (URL) -> Void) {
        guard let url = URL(string: urlString) else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, _, _ in
            let fileManager = FileManager.default
            guard let data = data,
            let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else {
                return
            }
            let fileUrl = documentsUrl.appendingPathComponent("image.jpg")
            do {
                try data.write(to: fileUrl)
                DispatchQueue.main.async {
                    completion(fileUrl)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
