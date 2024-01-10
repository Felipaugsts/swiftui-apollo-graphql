// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CharactersByFilterQuery: GraphQLQuery {
  public static let operationName: String = "CharactersByFilter"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query CharactersByFilter($name: String!) { characters(filter: { name: $name }) { __typename results { __typename episode { __typename id name } } } }"#
    ))

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var __variables: Variables? { ["name": name] }

  public struct Data: CharactersAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { CharactersAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("characters", Characters?.self, arguments: ["filter": ["name": .variable("name")]]),
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
          .field("episode", [Episode?].self),
        ] }

        /// Episodes in which this character appeared.
        public var episode: [Episode?] { __data["episode"] }

        /// Characters.Result.Episode
        ///
        /// Parent Type: `Episode`
        public struct Episode: CharactersAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { CharactersAPI.Objects.Episode }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", CharactersAPI.ID?.self),
            .field("name", String?.self),
          ] }

          /// The id of the episode.
          public var id: CharactersAPI.ID? { __data["id"] }
          /// The name of the episode.
          public var name: String? { __data["name"] }
        }
      }
    }
  }
}
