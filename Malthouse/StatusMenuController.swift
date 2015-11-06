import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var statusView: StatusView!

    var statusMenuItem: NSMenuItem!

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    let status = internetStatus()
    
    override func awakeFromNib() {
        statusItem.title = "Malthouse Fucked?"
        statusItem.menu = statusMenu
        statusMenuItem = statusMenu.itemWithTitle("Status")
        statusMenuItem.view = statusView
        
        NSTimer.scheduledTimerWithTimeInterval(15, target: self, selector: "refreshData:", userInfo: nil, repeats: true)

        updateStatus()
    }
    
    func refreshData(timer: NSTimer){
        updateStatus()
    }
    
    func updateStatus() {
        NSLog("Updating internet status")
        status.fetch() { status in
            self.statusView.update(status)
            self.statusItem.title = "Malthouse Fucked? \(status.state)"
        }
    }
    
    @IBAction func updateClicked(sender: NSMenuItem) {
        updateStatus()
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }
}
