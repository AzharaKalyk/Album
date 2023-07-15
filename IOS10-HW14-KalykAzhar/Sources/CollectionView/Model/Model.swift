import Foundation

struct Model {
    let image: String
    let name: String
    let description: String
}

class DataManager {
    private init() {}
    
    static let shared = DataManager()
    
    func createModels() -> [[Model]] {
        return [
            [
                Model(image: "1", name: "Недавние", description: "77"),
                Model(image: "2", name: "Избранное", description: "23"),
                Model(image: "3", name: "WhatsApp", description: "108"),
                Model(image: "4", name: "VN", description: "14"),
                Model(image: "5", name: "InShot", description: "12"),
                Model(image: "6", name: "Instagram", description: "88"),
                Model(image: "7", name: "DazzCam", description: "65"),
                Model(image: "8", name: "RedDart", description: "31"),
            ],
            [
                Model(image: "9", name: "Отдых", description: "98"),
                Model(image: "10", name: "Развитие", description: "44"),
                Model(image: "11", name: "Дом", description: "38"),
                Model(image: "12", name: "Культура", description: "111"),
            ],
            [
                Model(image: "video", name: "Видео", description: "22"),
                Model(image: "person.crop.square", name: "Селфи", description: "93"),
                Model(image: "livephoto", name: "Фото Live Photos", description: "77"),
                Model(image: "cube", name: "Портреты", description: "86"),
                Model(image: "pano", name: "Панорамы", description: "79"),
                Model(image: "square.stack.3d.down.right", name: "Серии", description: "45"),
            ],
            [
                Model(image: "square.stack.3d.forward.dottedline", name: "Анимирование", description: "34"),
                Model(image: "square.and.arrow.down", name: "Импортированные", description: "12"),
                Model(image: "eye.slash", name: "Скрытые", description: "65"),
                Model(image: "trash", name: "Недавно удаленные", description: "78"),
            ]
        ]
        
    }
}
