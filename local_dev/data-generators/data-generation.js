const faker = require('faker');
const shortid = require('shortid');

// For putting together the SQL insert for the sales_period tables.
var theTable = "sales_regions.region2.sales_period_"
var theColumns = "(id, amount, location, stamp)"
// For putting together the region 1 tables.
var theTableRegion1Sales = "sales_regions.region1.region1sales"
var theColumnsRegion1Sales = "(identifier, sale, dtmark, shipped, city)"
var theTableSystem2Sales = "sales_regions.region1.system2sales"
var theColumnsSystem2Sales = '(amount, \"date\", salenote, notes)'

function sales_period() {
    var nowStamp = new Date(faker.date.past())
    return "('" +
        faker.datatype.uuid() + "','" +
        faker.datatype.number({min: 15, max:200}) + "','" +
        faker.address.country().replace("'", " ") + "','" +
        nowStamp.toISOString() + "')"
}

function region_1_sales() {
    // (identifier, sale, dtmark, shipped, city)
    var nowStamp = new Date(faker.date.past())
    return "('" +
        shortid.generate() + "','" +
        faker.datatype.number({min: 15, max:200}) + "','" +
        nowStamp.toISOString() + "','" +
        faker.datatype.number({min: 0, max:1}) + "','" +
        faker.address.city().replace("'", " ") + "')"
}

function system_2_sales() {
    var nowStamp = new Date(faker.date.past())
    return "('" +
        faker.datatype.number({min: 15, max:200}) + "','" +
        nowStamp.toISOString() + "','" +
        faker.datatype.string().charAt(0) + "','"
        faker.lorem.paragraphs(3) + "')"
}

var min = 50, max = 500

insertGeneratedData('insert1.sql', theTable + "1", theColumns, min, max, sales_period)
insertGeneratedData( 'insert2.sql', theTable + "2", theColumns, min, max, sales_period)
insertGeneratedData( 'insert3.sql', theTable + "3", theColumns, min, max, sales_period)
insertGeneratedData( 'insert4.sql', theTable + "4", theColumns, min, max, sales_period)
insertGeneratedData('insert_reg1sales.sql', theTableRegion1Sales, theColumnsRegion1Sales, min, max, region_1_sales)
insertGeneratedData('insert_sys2sales.sql', theTableSystem2Sales, theColumnsSystem2Sales, min, max, system_2_sales)

function insertGeneratedData(file, table, columns, minRecords, maxRecords, generateValuesFunction) {
    var data = "";
    let fs = require('fs');
    var numberOfRecords = faker.datatype.number({min: minRecords, max: maxRecords})

    for  (var i = 0; i < numberOfRecords; i++) {
        var insertPre = "INSERT INTO"
        var insertMid = "VALUES"
        var theValues = generateValuesFunction()
        var insertPost = "\n  GO\n"

        data += insertPre + " " +
            table + " " +
            columns + " " +
            insertMid + " " +
            theValues + " " +
            insertPost
    }

    fs.writeFile(file, data, function(err) {
        if (err) return console.log(err)
        console.log('Wrote ' + numberOfRecords + ' records to ' + file + ' file to the disk.')
    })
}
