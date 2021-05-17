var express = require('express')
var { graphqlHTTP } = require('express-graphql')
var { buildSchema } = require('graphql')

var schema = buildSchema(`
    type Query {
        hello: String
    }
`)

var root = {
    hello: () => {
        return "Hello world!"
    }
}

var app = express()
app.use('/graphql', graphqlHTTP({
    schema: schema,
    rootValue: root,
    graphiql: true,
}))
app.listen(6066)
console.log('Running a GraphQL API Server at http://localhost:6066/graphql.')