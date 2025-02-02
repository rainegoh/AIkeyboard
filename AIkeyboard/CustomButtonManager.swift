import Foundation

class CustomButtonManager {
    static let shared = CustomButtonManager()
    private let userDefaults = UserDefaults(suiteName: "group.com.yourdomain.aikeyboard")
    private let customButtonsKey = "customButtons"
    
    func saveCustomButton(_ button: CustomButton) {
        var buttons = getCustomButtons()
        buttons.append(button)
        saveButtons(buttons)
    }
    
    func getCustomButtons() -> [CustomButton] {
        guard let data = userDefaults?.data(forKey: customButtonsKey),
              let buttons = try? JSONDecoder().decode([CustomButton].self, from: data) else {
            return []
        }
        return buttons
    }
    
    func deleteCustomButton(withId id: UUID) {
        var buttons = getCustomButtons()
        buttons.removeAll { $0.id == id }
        saveButtons(buttons)
    }
    
    private func saveButtons(_ buttons: [CustomButton]) {
        guard let data = try? JSONEncoder().encode(buttons) else { return }
        userDefaults?.set(data, forKey: customButtonsKey)
    }
}
