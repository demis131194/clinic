DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rooms;

DROP SEQUENCE IF EXISTS reservations_reservationId_seq;
DROP SEQUENCE IF EXISTS rooms_roomId_seq;
DROP SEQUENCE IF EXISTS users_userId_seq;

CREATE TABLE public.users
(
    user_id serial NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    user_role character varying NOT NULL,
    PRIMARY KEY (user_id)
)
    WITH (
        OIDS = FALSE
    );

ALTER TABLE public.users
    OWNER to postgres;

CREATE TABLE public.rooms
(
    room_id serial NOT NULL,
    room_name character varying NOT NULL,
    status character varying NOT NULL DEFAULT 'FREE',
    PRIMARY KEY (room_id)
)
    WITH (
        OIDS = FALSE
    );

ALTER TABLE public.rooms
    OWNER to postgres;

CREATE TABLE public.reservations
(
    reservation_id serial NOT NULL,
    operation_name character varying NOT NULL,
    description text,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    status character varying NOT NULL,
    user_id bigint NOT NULL,
    room_id bigint NOT NULL,
    PRIMARY KEY (reservation_id),
    CONSTRAINT reservation_userId_foreign_key_constraint FOREIGN KEY (user_id)
        REFERENCES public.users ("user_id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT reservation_roomId_foreign_key_constraint FOREIGN KEY ("room_id")
        REFERENCES public.rooms ("room_id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
    WITH (
        OIDS = FALSE
    );

ALTER TABLE public.reservations
    OWNER to postgres;

INSERT INTO users(name, surname, "user_role")
VALUES ('Petr', 'Petrovich', 'DOCTOR'),
       ('Olga', 'Olgavna', 'NURSE'),
       ('Dmitry', 'Dmitrievich', 'DOCTOR');

INSERT INTO rooms("room_name", status)
VALUES ('Room_1', 'FREE'),
       ('Room_2', 'FREE'),
       ('Room_3', 'FREE');

INSERT INTO reservations("operation_name", description, "start_time", "end_time", status, "user_id", "room_id")
VALUES ('therapy', null, '2020-05-01 04:05:06+03', '2020-05-01 07:05:06+03', 'END', 1, 1),
       ('medical procedure', 'injection of medicine', '2020-05-02 14:12:06+03', '2020-05-02 14:25:12+03', 'NEW', 2, 2),
       ('consultation', null, '2020-05-03 17:05:06+03', '2020-05-01 17:55:00+03', 'NEW', 3, 1);