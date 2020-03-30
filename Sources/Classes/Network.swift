//
//  Network.swift
//  ScryfallApiSwift
//
//  Created by Eric Internicola on 3/28/20.
//

import Foundation

// MARK: - CancellableTask

public protocol CancellableTask {

    /// Cancels the request
    func cancel()

    /// Begin the task.
    func begin()
}

// MARK: - Resource

public struct Resource<T: Decodable> {
    public let url: URL
    public let postData: Data?

    /// Fetches this Resource for you (delegates off to URLRequest.load).
    /// - Parameters:
    ///   - beginFetch: Should the CancellableTask be kicked off now?  If yes, then
    ///   `begin()` is called.  If not, then that is up to you to do at a later time.
    ///   - completion: The completion handler.
    public func fetch<T>(beginFetch: Bool = true, completion: @escaping (Result<T, Error>) -> Void) -> CancellableTask {
        return URLRequest.load(resource: self, beginFetch: beginFetch) { result in
            switch result {
            case .success(let result):
                guard let result = result as? T else {
                    return completion(.failure(URLRequestError.noData(self.url)))
                }
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

// MARK: - URLRequest.load(resource:completion:)

extension URLRequest {

    /// Performs a GET or POST of an HTTP resource and calls back to your provided completion handler.
    /// - Parameters:
    ///   - resource: The resource you want to fetch.
    ///   - beginFetch: Should the fetch begin yet?
    ///   - completion: The callback to give you success / failure state with values.
    static func load<T>(resource: Resource<T>, beginFetch: Bool = true, completion: @escaping (Result<T, Error>) -> Void) -> CancellableTask {

        var request = URLRequest(url: resource.url)
        if let postData = resource.postData {
            request.httpBody = postData
            request.httpMethod = "POST"
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 1. If there's an error, fail immediately:
            if let error = error {
                return completion(.failure(error))
            }

            // 2. Ensure we got back an HTTPURLResponse (this should always succeed)
            guard let httpResponse = response as? HTTPURLResponse else {
                return completion(.failure(URLRequestError.invalidResponseObject(resource.url)))
            }

            // 3. Ensure we got back an HTTP 200 (OK) or fail with the status code
            guard httpResponse.statusCode == 200 else {
                return completion(.failure(
                    URLRequestError.invalidStatusCode(resource.url, httpResponse.statusCode)))
            }

            // 4. Ensure we got back data or fail
            guard let data = data else {
                return completion(.failure(URLRequestError.noData(resource.url)))
            }

            // 5. Finally, decode the data and hand it back
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }

        if beginFetch {
            // Begin the network request
            task.resume()
        }

        return task
    }

}

// MARK: - URLRequestError

public enum URLRequestError: Error {
    case invalidResponseObject(URL)
    case invalidStatusCode(URL, Int)
    case noData(URL)
}

// MARK: CancellableTask conformance

extension URLSessionDataTask: CancellableTask {

    public func begin() {
        resume()
    }

}

