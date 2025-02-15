import SwiftUI

enum SceneFlow {
    case auth
    case main
}

@propertyWrapper
struct AppState: DynamicProperty {
    @EnvironmentObject private var object: AppStateProvider

    var wrappedValue: AppStateProvider {
        object
    }

    init() { }
}

final class AppStateProvider: ObservableObject {
    @Published var sceneFlow: SceneFlow

    init(sceneFlow: SceneFlow) {
        self.sceneFlow = sceneFlow
    }
}
