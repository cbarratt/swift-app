import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var statusView: StatusView!

    var statusMenuItem: NSMenuItem!

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    let status = internetStatus()
    
    override func awakeFromNib() {
        statusItem.title = "Is the Malthouse Fucked?"
        statusItem.menu = statusMenu
        statusMenuItem = statusMenu.itemWithTitle("Status")
        statusMenuItem.view = statusView

        updateStatus()
    }
    
    func updateStatus() {
        status.fetch() { status in
            self.statusView.update(status)
        }
    }
    
    @IBAction func updateClicked(sender: NSMenuItem) {
        updateStatus()
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }
}
