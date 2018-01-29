import Cocoa

class StatusMenuController: NSObject, LatencyAPIDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    let iconBlack = NSImage(named: NSImage.Name(rawValue : "speedometerBlack"))
    let iconRed = NSImage(named: NSImage.Name(rawValue : "speedometerRed"))
    let iconOrange = NSImage(named: NSImage.Name(rawValue : "speedometerOrange"))
    let iconGreen = NSImage(named: NSImage.Name(rawValue : "speedometerGreen"))
    let iconGold = NSImage(named: NSImage.Name(rawValue : "speedometerGold"))
    
    var latencyAPI : LatencyAPI!
    var timer: Timer?
    
    let fefreshRate: TimeInterval = 3
    var refreshTimer: Timer?
    
    override func awakeFromNib() {
        statusItem.title = "Bravo"
        statusItem.menu = statusMenu
        
        latencyAPI = LatencyAPI()
        
        
        statusItem.image = iconBlack
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
        latencyAPI.fetchLatency { l in
            let latency = Int(l)
            self.statusItem.title = "\(latency)"
            
            if latency < 100 {
                if latency < 50 {
                    if latency < 15 {
                        self.statusItem.image = self.iconGreen
                    }
                    else {
                      self.statusItem.image = self.iconGold
                    }
                }
                else {
                  self.statusItem.image = self.iconOrange
                }
            }
            else {
                self.statusItem.image = self.iconRed
            }

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
