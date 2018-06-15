import Vapor
import FluentPostgreSQL

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    
    init(short: String, long: String) {
        self.short = short
        self.long = long
    }
}

extension Acronym: PostgreSQLModel {}

extension Acronym: Migration {
  static func prepare(on connection: PostgreSQLConnection) -> Future<Void> {
    return Database.create(self, on: connection) { builder in
      builder.field(for: \.id)
      builder.field(for: \.short)
      builder.field(for: \.long)
    }
  }
}

extension Acronym: Content {}

extension Acronym: Parameter {}
