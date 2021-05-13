insert into railroad_systems.railroads (id, name, created_at, updated_at, description, history, headquarters_city, active, uri)
values  ('bXhB_iJ_', 'Amtrak', '2021-05-11 18:09:17.862953', '2021-05-11 18:09:17.862953', null, null, null, true, 'https://www.amtrak.com/'),
        ('_y7dqDTC', 'Sound Transit', '2021-05-11 18:09:17.862953', '2021-05-11 18:09:17.862953', null, null, null, true, 'https://www.soundtransit.org/'),
        ('n8FJifI6', 'Caltrain', '2021-05-11 18:09:17.862953', '2021-05-11 18:09:17.862953', null, null, null, true, 'https://www.caltrain.com/'),
        ('P4QnfbTe', 'Altamont Corridor Express', '2021-05-11 18:19:41.056846', '2021-05-11 18:20:45.474083', null, null, 'Stockton, CA', false, 'https://acerail.com/'),
        ('xaVMWv2J', 'Metrolink', '2021-05-11 18:22:18.693507', '2021-05-11 18:22:18.693507', null, null, 'Los Angeles, CA', false, 'https://metrolinktrains.com/'),
        ('Vxod6quX', 'Coaster', '2021-05-11 18:24:06.636178', '2021-05-11 18:24:06.636178', null, null, 'Oceanside, CA', false, 'https://gonctd.com/services/coaster-commuter-rail/');

insert into railroad_systems.trains (id, name, historical_start, historical_end, description, notes)
values  ('g6j04smx', 'Sounder South 1500', null, null, '', ''),
        ('2f3iTDh3', 'Sounder South 1502', null, null, '', ''),
        ('GGgtJ2tZ', 'Sounder South 1503', null, null, '', ''),
        ('Q7TRq3C0', 'Sounder South 1504', null, null, '', ''),
        ('Rd1k4LBF', 'Sounder South 1506', null, null, '', ''),
        ('S38tO2PC', 'Sounder North 1703', null, null, '', ''),
        ('Dfu4bI6D', 'Sounder North 1702', null, null, '', ''),
        ('SpydnlD0', 'Sounder North 1707', null, null, '', ''),
        ('NIL_HSA3', 'Sounder North 1706', null, null, '', ''),
        ('PhQfKUos', 'Coast Starlight 11', null, null, '', ''),
        ('NmdizXwL', 'Coast Starlight 14', null, null, '', '');

insert into railroad_systems.operators (train_id, railroad_id, details)
values  ('g6j04smx', '_y7dqDTC', ''),
        ('2f3iTDh3', '_y7dqDTC', ''),
        ('GGgtJ2tZ', '_y7dqDTC', ''),
        ('Q7TRq3C0', '_y7dqDTC', ''),
        ('Rd1k4LBF', '_y7dqDTC', ''),
        ('S38tO2PC', '_y7dqDTC', ''),
        ('Dfu4bI6D', '_y7dqDTC', ''),
        ('SpydnlD0', '_y7dqDTC', ''),
        ('NIL_HSA3', '_y7dqDTC', ''),
        ('PhQfKUos', 'bXhB_iJ_', ''),
        ('NmdizXwL', 'bXhB_iJ_', '');





