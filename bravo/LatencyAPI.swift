import Foundation

protocol LatencyAPIDelegate {
    func consumeLatency(_ latency: Int)
}

class LatencyAPI {
    var delegate: LatencyAPIDelegate?
    
    init(delegate: LatencyAPIDelegate) {
        self.delegate = delegate
    }
    
    func fetchLatency() {
      self.delegate?.consumeLatency(12)
       NSLog("12")
    }
}
