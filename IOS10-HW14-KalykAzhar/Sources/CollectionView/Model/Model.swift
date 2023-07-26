import UIKit

struct ItemModel: Equatable {
    var image: String
    var name: String
    var description: String
}

struct SectionModel {
    var title: String
    var buttonIsHidden: Bool?
    var items: [ItemModel]
}

extension SectionModel {
    static var sectionModels: [SectionModel] = [
        SectionModel(
            title: "Мои альбомы",
            buttonIsHidden: false,
            items: [
                ItemModel(image: "1", name: "Недавние", description: "77"),
                ItemModel(image: "2", name: "Избранное", description: "23"),
                ItemModel(image: "3", name: "WhatsApp", description: "108"),
                ItemModel(image: "4", name: "VN", description: "14"),
                ItemModel(image: "5", name: "InShot", description: "12"),
                ItemModel(image: "6", name: "Instagram", description: "88"),
                ItemModel(image: "7", name: "DazzCam", description: "65"),
                ItemModel(image: "8", name: "RedDart", description: "31"),
            ]
        ),
        SectionModel(
            title: "Общие альбомы",
            items: [
                ItemModel(image: "9", name: "Отдых", description: "98"),
                ItemModel(image: "10", name: "Развитие", description: "44"),
                ItemModel(image: "11", name: "Дом", description: "38"),
                ItemModel(image: "12", name: "Культура", description: "111"),
            ]
        ),
        SectionModel(
            title: "Типы медиафайлов",
            items: [
                ItemModel(image: "video", name: "Видео", description: "22"),
                ItemModel(image: "person.crop.square", name: "Селфи", description: "93"),
                ItemModel(image: "livephoto", name: "Фото Live Photos", description: "77"),
                ItemModel(image: "cube", name: "Портреты", description: "86"),
                ItemModel(image: "pano", name: "Панорамы", description: "79"),
                ItemModel(image: "square.stack.3d.down.right", name: "Серии", description: "45"),
            ]
        ),
        SectionModel(
            title: "Другое",
            items: [
                ItemModel(image: "square.stack.3d.forward.dottedline", name: "Анимирование", description: "34"),
                ItemModel(image: "square.and.arrow.down", name: "Импортированные", description: "12"),
                ItemModel(image: "eye.slash", name: "Скрытые", description: "65"),
                ItemModel(image: "trash", name: "Недавно удаленные", description: "78"),
            ]
        )
    ]
}
