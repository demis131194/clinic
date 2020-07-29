INSERT INTO users(name, surname, "user_role")
VALUES ('Petr', 'Petrovich', 'DOCTOR'),
       ('Olga', 'Olgavna', 'NURSE'),
       ('Valera', 'Valerievich', 'DOCTOR'),
       ('Marina', 'Marinovna', 'NURSE'),
       ('Dmitry', 'Dmitrievich', 'DOCTOR');

INSERT INTO rooms("room_name", status)
VALUES ('Room_1', 'FREE'),
       ('Room_2', 'FREE'),
       ('Room_3', 'FREE');

INSERT INTO reservations("operation_name", description, "start_time", "end_time", status, "user_id", "room_id")
VALUES ('therapy', null, '2020-06-01 04:05:06+03', '2020-06-01 07:05:06+03', 'ENDED', 1, 1),
       ('medical procedure', 'injection of medicine', '2020-05-02 14:12:06+03', '2020-05-02 14:25:12+03', 'ENDED', 2, 2),
       ('medical procedure', 'injection of medicine', '2020-05-02 14:12:06+03', '2020-05-02 14:25:12+03', 'ENDED', 4, 3),
       ('consultation', null, '2020-07-29 17:05:06+03', '2020-08-01 17:55:00+03', 'RUNNING', 1, 1),
       ('consultation', null, '2020-08-02 17:05:06+03', '2020-08-05 17:55:00+03', 'NEW', 1, 1),
       ('consultation', null, '2020-07-30 17:05:06+03', '2020-08-05 17:55:00+03', 'NEW', 2, 2);