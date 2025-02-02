import Foundation

struct CustomButton: Codable, Identifiable {
    let id: UUID
    var title: String
    var systemPrompt: String
    
    init(id: UUID = UUID(), title: String, systemPrompt: String) {
        self.id = id
        self.title = title
        self.systemPrompt = systemPrompt
    }
}
