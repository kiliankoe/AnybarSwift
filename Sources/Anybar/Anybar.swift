import Foundation

public struct Anybar {
    public let port: Int

    public init(port: Int) {
        self.port = port
    }

    public static let `default` = Anybar(port: 1738)

    public func update(with color: Color) {
        let command = "/bin/bash"
        let args = ["-c", "echo -n \"\(color.rawValue)\"  | nc -4u -w0 localhost \(self.port)"]
        let task = Process()

        task.launchPath = command
        task.arguments = args
        task.launch()
    }

    public enum Color: String {
        case white
        case red
        case orange
        case yellow
        case green
        case cyan
        case blue
        case purple
        case black

        case question
        case exclamation

        case quit
    }
}
