import Foundation

protocol LatencyAPIDelegate {
    func consumeLatency(_ latency: Int)
}

class LatencyAPI {
    func fetchLatency(success: @escaping (Int) -> Void) {
       success(12)
       NSLog("12")
    }
}
