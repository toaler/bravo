import Foundation
import PlainPing

protocol LatencyAPIDelegate {
    func consumeLatency(_ latency: Int)
}

class LatencyAPI {
    func fetchLatency(completion: @escaping (Double) -> Void) {
        
        PlainPing.ping("www.google.com", withTimeout: 1.0, completionBlock: { (timeElapsed:Double?, error:Error?) in
            if let latency = timeElapsed {
                NSLog("\(latency)")
                completion(latency)
            }
            
            if let error = error {
                print("error: \(error.localizedDescription)")
            }
        })
    }
}
