// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CharactersListQuery: GraphQLQuery {
  public static let operationName: String = "CharactersList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query CharactersList { characters { __typename results { __typename id name status species image } } }"#
    ))

  public init() {}

  public struct Data: CharactersAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { CharactersAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("characters", Characters?.self),
    ] }

    /// Get the list of all characters
    public var characters: Characters? { __data["characters"] }

    /// Characters
    ///
    /// Parent Type: `Characters`
    public struct Characters: CharactersAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { CharactersAPI.Objects.Characters }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
      ] }

      public var results: [Result?]? { __data["results"] }

      /// Characters.Result
      ///
      /// Parent Type: `Character`
      public struct Result: CharactersAPI.SelectionSet {
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
