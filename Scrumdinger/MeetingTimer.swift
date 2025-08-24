import Foundation
import Combine

public final class MeetingTimer: ObservableObject {
    @Published public var elapsedSeconds: Int = 0
    @Published public var remainingSeconds: Int
    
    private var duration: Int
    private var timer: Timer?
    
    public init(duration: Int) {
        self.duration = duration
        self.remainingSeconds = duration
    }
    
    public func start() {
        stop()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.remainingSeconds > 0 {
                self.elapsedSeconds += 1
                self.remainingSeconds -= 1
            } else {
                self.stop()
            }
        }
    }
    
    public func stop() {
        timer?.invalidate()
        timer = nil
    }
}
