import Cocoa

class StatusMenuController: NSObject, LatencyAPIDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    var latencyAPI : LatencyAPI!
    
    override func awakeFromNib() {
        statusItem.title = "Bravo"
        statusItem.menu = statusMenu
        
        latencyAPI = LatencyAPI(delegate: self)
        
        
        let icon = NSImage(named: NSImage.Name(rawValue : "statusIcon"))
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        updateLatency()
    }
    
    func updateLatency() {
        latencyAPI.fetchLatency()
    }
    
    @IBAction func updateClicked(_ sender: Any) {
        latencyAPI.fetchLatency()
    }
    
    @IBAction func quitClicked(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
    
    func consumeLatency(_ latency: Int) {
      statusItem.title = "\(latency)"
      NSLog("\(latency)")
    }
}
