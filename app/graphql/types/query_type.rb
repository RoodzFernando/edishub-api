module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Return a list of all the users
    field :users, [Types::UserType], null: false,
    description: "Return a list of all users"
    def users
      User.all
    end

    # Return all the resources and its corresponding categories
    field :resources, [Types::ResourceType], null: false,
    description: "Return a listing of all resources and categories"

    def resources
      Resource.preload(:categories, :tags)
    end

    # Find and return the fields for a particular resource
    field :resource, Types::ResourceType, null: false do
      argument :id, String, required: true
    end

    def resource(id:)
      Resource.find(id)
    end
  end
end
