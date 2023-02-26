//
//  ImageService.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

protocol ImageService {
    func fetchImage(for url: URL, completion: @escaping (UIImage?) -> Void)
}

// MARK: - Implementation

final class MainImageService: ImageService {
    private let imageCache = NSCache<NSURL, UIImage>()
}

// MARK: - Access

extension MainImageService {
    func fetchImage(for url: URL, completion: @escaping (UIImage?) -> Void) {
        if let image = loadImageFromCache(for: url) {
            completion(image)
            
        } else {
            loadImageFromNetwork(for: url, completion: completion)
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
    private func loadImageFromNetwork(for url: URL, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
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
    }
    
    private func addImageToCache(_ image: UIImage?, for url: URL) {
        guard let image = image,
            let nsurl = NSURL(string: url.absoluteString)
        else { return }
        imageCache.setObject(image, forKey: nsurl)
    }
}
