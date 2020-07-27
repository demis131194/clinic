DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rooms;

DROP SEQUENCE IF EXISTS reservations_reservationId_seq;
DROP SEQUENCE IF EXISTS rooms_roomId_seq;
DROP SEQUENCE IF EXISTS users_userId_seq;

CREATE TABLE public.users
(
    "userId" serial NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    "position" character varying NOT NULL,
    PRIMARY KEY ("userId")
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.users
    OWNER to postgres;

CREATE TABLE public.rooms
(
    "roomId" serial NOT NULL,
    "roomName" character varying NOT NULL,
    status character varying NOT NULL DEFAULT 'FREE',
    PRIMARY KEY ("roomId")
)
    WITH (
        OIDS = FALSE
    );

ALTER TABLE public.rooms
    OWNER to postgres;

CREATE TABLE public.reservations
(
    "reservationId" serial NOT NULL,
    "operationName" character varying NOT NULL,
    "description" text,
    "startTime" timestamp with time zone NOT NULL,
    "endTime" timestamp with time zone NOT NULL,
    "status" character varying NOT NULL,
    "userId" bigint NOT NULL,
    "roomId" bigint NOT NULL,
    PRIMARY KEY ("reservationId"),
    CONSTRAINT reservation_userId_foreign_key_constraint FOREIGN KEY ("userId")
        REFERENCES public.users ("userId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT reservation_roomId_foreign_key_constraint FOREIGN KEY ("roomId")
        REFERENCES public.rooms ("roomId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
    WITH (
        OIDS = FALSE
    );

ALTER TABLE public.reservations
    OWNER to postgres;