// var request = require('request');
// var options = {
//     'method': 'POST',
//     'url': 'http://localhost:8080/v1/graphql',
//     'headers': {
//         'Content-Type': 'application/json'
//     },
//     body: JSON.stringify({
//         query: `mutation {
//   insert_railroad_systems_shipping_orders(objects: {notes: "N/A", order: "206-Lumber", weight: "30000000"}) {
//     affected_rows
//   }
// }`,
//         variables: {}
//     })
// };
// request(options, function (error, response) {
//     if (error) throw new Error(error);
//     console.log(response.body);
// });

    import { GraphQLClient, gql } from 'graphql-request'

    async function main() {
        const endpoint = 'http://localhost:8080/v1/graphql'

        const graphQLClient = new GraphQLClient(endpoint, {
            headers: {
                'Content-Type': 'application/json',
            },
        })

        const mutation = gql`mutation AddShippingOrder($notes: String!, $order: String!, $weight: Int!) {
            insert_railroad_systems_shipping_orders(objects: {notes: $notes, order: $order, weight: $weight}) {
                affected_rows
            }
        }`

        const variables = {
            notes: 'Testing notes.',
            order: '54-coal',
            weight: '96000000',
        }
        const data = await graphQLClient.request(mutation, variables)
        console.log(JSON.stringify(data, undefined, 2))
    }

    main().catch((error) => console.error(error))
