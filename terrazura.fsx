#r "nuget:Farmer"

open Farmer
open Farmer.Builders

let databaseServers = {|
    serverName = "farmerterrazuraserver"
    adminUsername = "adm1n157r470r" 
    adminPassword = "4-v3ry-53cr37-p455w0rd"
    database = "terrazuradb"
|}

let db = postgreSQL {
    name databaseServers.serverName
    storage_size 5<Gb>
    tier PostgreSQL.Sku.GeneralPurpose
    backup_retention 7<Days>
    geo_redundant_backup true
    storage_autogrow true
    admin_username databaseServers.adminUsername
    add_database databaseServers.database
    
    add_firewall_rules [
        "allow-azure-internal", "0.0.0.0", "0.0.0.0"
    ]
}

let hasura = containerGroup {
    name "terrazura-hasura-api"
    add_instances [
        containerInstance {
            name "hasura-data-layer-api"
            image "hasura/graphql-engine:v2.0.1"
            cpu_cores 0.5
            memory 1.5<Gb>
            add_public_ports [ 8080us ]
            env_vars [
                EnvVar.createSecure "HASURA_GRAPHQL_DATABASE_URL" "postgresconnstr"
                EnvVar.create "HASURA_GRAPHQL_SERVER_PORT" "8080"
                EnvVar.create "HASURA_GRAPHQL_ENABLE_CONSOLE" "false"
            ]
        }
    ]
    public_dns "terrazuradatalayer" [ TCP, 8080us]
}

let deployment = arm {
    location Location.EastUS
    add_resources [
        hasura
        db
    ]
}

let postgresconnstr = System.String.Format("postgres://{0}%40{1}:{2}@{3}.postgres.database.azure.com:5432/{4}", databaseServers.adminUsername, databaseServers.serverName, databaseServers.adminPassword, databaseServers.serverName, databaseServers.database)

let deploymentParameters = [
        "postgresconnstr", postgresconnstr
        $"password-for-{databaseServers.serverName}", databaseServers.adminPassword
    ]
deployment |> Deploy.execute "terrazuragrp" deploymentParameters
