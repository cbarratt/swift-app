import Cocoa

class StatusView: NSView {
    //@IBOutlet weak var statusTextField: NSTextField!
    @IBOutlet weak var statusText: NSTextField!

    func update(status: Status) {
        
        NSLog(status.state)
        // do UI updates on the main thread
        dispatch_async(dispatch_get_main_queue()) {
            self.statusText.stringValue = status.state
        }
    }
}
