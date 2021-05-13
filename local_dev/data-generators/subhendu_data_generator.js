faker = require('faker');
fs = require('fs');

var data = "id,country,ip,created_at,updated_at,project_id\n";
let project_ids = [
    'c16f6dd8-facb-406f-90d9-45529f4c8eb7',
    'b6dcbc07-e237-402a-bf11-12bf2226c243',
    '33f45cab-0e14-4830-a51c-fd44a62d1adc',
    '5d390c9e-2cfa-471d-953d-f6727972aeba',
    'd6ef3dfd-9596-4391-b0ef-3d7a8a1a6d10',
    'e72c0ed8-d649-4c53-97c5-da793d7a8228',
    'bf020fd2-2514-4709-8108-a2810e61c503',
    'ead66a4a-968a-448c-a796-51c6a1da0c20'];

function addDays(datetime, days) {
    let date = new Date(datetime.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}

function addHours(datetime, hours) {
    let time = new Date(datetime.valueOf())
    time.setTime(time.getTime() + (hours*60*60*1000));
    return time;
}

for (var i = 0; i < 150; i++) {
    var days = faker.datatype.number({min:0, max:7})
    var hours = faker.datatype.number({min:0, max:24})

    var updated_at = new Date(faker.date.past())
    var created_at = addHours(addDays(updated_at, -days), -hours)

    var proj_id = project_ids[faker.datatype.number({min:0, max: 7})]
    var cleanCountry = faker.address.country().replace(",", " ").replace("'", " ")

    data +=
        faker.datatype.uuid() + "," +
        cleanCountry + "," +
        faker.internet.ip() + "," +
        created_at.toISOString() + "," +
        updated_at.toISOString() + "," +
        proj_id + "\n"
}

fs.writeFile('kundu_table_data.csv', data, function (err) {
    if (err) return console.log(err);
    console.log('Data file written.');
});