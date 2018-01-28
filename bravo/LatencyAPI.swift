import Foundation

protocol LatencyAPIDelegate {
    func consumeLatency(_ latency: Int)
}

class LatencyAPI {
    func fetchLatency(completion: @escaping (Double) -> Void) {
        let timeInterval = NSDate().timeIntervalSince1970
        NSLog("\(timeInterval)")
        completion(timeInterval)
    }
}
