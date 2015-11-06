import Cocoa

class StatusView: NSView {
    @IBOutlet weak var statusText: NSTextField!

    func update(status: Status) {
        dispatch_async(dispatch_get_main_queue()) {
            self.statusText.stringValue = status.state
        }
    }
}
