//
//  ImageService.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

protocol ImageService {
    func fetchImage(for url: URL, completion: @escaping (UIImage?) -> Void) -> Cancellable?
}

// MARK: - Implementation

final class MainImageService: ImageService {
    private let imageCache = NSCache<NSURL, UIImage>()
}

// MARK: - Access

extension MainImageService {
    /// Fetches an image from the provided URL. If a network request is initiated a cancellable object will be returned.
    @discardableResult
    func fetchImage(for url: URL, completion: @escaping (UIImage?) -> Void) -> Cancellable? {
        if let image = loadImageFromCache(for: url) {
            completion(image)
            return nil
            
        } else {
            return loadImageFromNetwork(for: url, completion: completion)
        }
    }
}

// MARK: - Load Image From Cache

extension MainImageService {
    private func loadImageFromCache(for url: URL) -> UIImage? {
        guard let nsurl = NSURL(string: url.absoluteString) else { return nil }
        return imageCache.object(forKey: nsurl)
    }
}

// MARK: - Load Image From Network

extension MainImageService {
    private func loadImageFromNetwork(for url: URL,
                                      completion: @escaping (UIImage?) -> Void
    ) -> Cancellable? {
        // TODO: move this over to use network router to facilitate testing
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            let image: UIImage?
            defer {
                DispatchQueue.main.async {
                    completion(image)
                }
            }
            
            guard let imageData = try? Data(contentsOf: url) else {
                image = nil
                return
            }
            image = UIImage(data: imageData)
            self?.addImageToCache(image, for: url)
        }
        dataTask.resume()
        return dataTask
    }
    
    private func addImageToCache(_ image: UIImage?, for url: URL) {
        guard let image = image,
            let nsurl = NSURL(string: url.absoluteString)
        else { return }
        imageCache.setObject(image, forKey: nsurl)
    }
}
