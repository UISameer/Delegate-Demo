import Foundation

struct ResponseData: Codable {
    let data: [DataModel]
    let included:[Included]
}

struct Included: Codable {
    let type: String
    let id: String
    let attributes: IAttribute
}

struct IAttribute: Codable {
    let name: String
    let age: Int
    let gender: String
}

struct DataModel: Codable {
    let type: String
    let id: String
    let attributes: Attribute
    let relationships: Relationship
}

struct Attribute: Codable {
    let title: String
    let body: String
    let created: String
    let updated: String
}

struct Relationship: Codable {
    let author: Auhor
}

struct Auhor: Codable {
    let data: DataType
}

struct DataType: Codable {
    let id : String
    let type: String
}

