import Foundation

// MARK: - User
struct User: Decodable {
    let results: [Result]?
}


// MARK: - Result
struct Result: Decodable {
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let login: Login?
    let dob, registered: Dob?
    let phone, cell: String?
    let id: ID?
    let picture: Picture?
    let nat: String?
}

// MARK: - Dob
struct Dob: Decodable {
    let date: String?
    let age: Int?
}

// MARK: - ID
struct ID: Decodable {
    let name, value: String?
}

// MARK: - Location
struct Location: Decodable {
    let street: Street?
    let city, state, country: String?
    let postcode: Int?
    let coordinates: Coordinates?
    let timezone: Timezone?
}

// MARK: - Coordinates
struct Coordinates: Decodable {
    let latitude, longitude: String?
}

// MARK: - Street
struct Street: Decodable {
    let number: Int?
    let name: String?
}

// MARK: - Timezone
struct Timezone: Decodable {
    let offset, timezoneDescription: String?
}

// MARK: - Login
struct Login: Decodable {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?
}

// MARK: - Name
struct Name: Decodable {
    let title, first, last: String?
}

// MARK: - Picture
struct Picture: Decodable {
    let large, medium, thumbnail: String?
}
