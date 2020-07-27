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
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT reservation_roomId_foreign_key_constraint FOREIGN KEY ("room_id")
        REFERENCES public.rooms ("room_id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
    WITH (
        OIDS = FALSE
    );

ALTER TABLE public.reservations
    OWNER to postgres;