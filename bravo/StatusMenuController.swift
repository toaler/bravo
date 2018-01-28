import Cocoa

class StatusMenuController: NSObject, LatencyAPIDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    var latencyAPI : LatencyAPI!
    var timer: Timer?
    
    let fefreshRate: TimeInterval = 3
    var refreshTimer: Timer?
    
    override func awakeFromNib() {
        statusItem.title = "Bravo"
        statusItem.menu = statusMenu
        
        latencyAPI = LatencyAPI()
        
        let icon = NSImage(named: NSImage.Name(rawValue : "statusIcon"))
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        enableTimer()
    }
    
    func enableTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                             target: self,
                             selector: #selector(self.updateLatency),
                             userInfo: nil,
                             repeats: true)
        
    }
    
    func disableTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @objc func updateLatency() {
        latencyAPI.fetchLatency { latency in
            self.statusItem.title = "\(latency)"
            NSLog("\(latency)")
        }
    }
    
    @IBAction func updateClicked(_ sender: Any) {
        updateLatency()
    }
    
    @IBAction func quitClicked(_ sender: Any) {
        disableTimer()
        NSApplication.shared.terminate(self)
    }
    
    func consumeLatency(_ latency: Int) {
      statusItem.title = "\(latency)"
      NSLog("\(latency)")
    }
    
    func timerFireMethod(timer: Timer) {
        updateLatency()
    }
}
