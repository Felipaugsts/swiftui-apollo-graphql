// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PlanetsQuery: GraphQLQuery {
  public static let operationName: String = "Planets"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Planets($id: ID!) { location(id: $id) { __typename id name dimension residents { __typename id name status species image } } }"#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: CharactersAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { CharactersAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("location", Location?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Get a specific locations by ID
    public var location: Location? { __data["location"] }

    /// Location
    ///
    /// Parent Type: `Location`
    public struct Location: CharactersAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { CharactersAPI.Objects.Location }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", CharactersAPI.ID?.self),
        .field("name", String?.self),
        .field("dimension", String?.self),
        .field("residents", [Resident?].self),
      ] }

      /// The id of the location.
      public var id: CharactersAPI.ID? { __data["id"] }
      /// The name of the location.
      public var name: String? { __data["name"] }
      /// The dimension in which the location is located.
      public var dimension: String? { __data["dimension"] }
      /// List of characters who have been last seen in the location.
      public var residents: [Resident?] { __data["residents"] }

      /// Location.Resident
      ///
      /// Parent Type: `Character`
      public struct Resident: CharactersAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { CharactersAPI.Objects.Character }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", CharactersAPI.ID?.self),
          .field("name", String?.self),
          .field("status", String?.self),
          .field("species", String?.self),
          .field("image", String?.self),
        ] }

        /// The id of the character.
        public var id: CharactersAPI.ID? { __data["id"] }
        /// The name of the character.
        public var name: String? { __data["name"] }
        /// The status of the character ('Alive', 'Dead' or 'unknown').
        public var status: String? { __data["status"] }
        /// The species of the character.
        public var species: String? { __data["species"] }
        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? { __data["image"] }
      }
    }
  }
}
