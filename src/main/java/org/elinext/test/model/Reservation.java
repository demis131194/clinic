package org.elinext.test.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "reservations")
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reservationId")
    private Long reservationId;

    @Column(name = "operationName")
    private String operationName;

    @Column(name = "description")
    private String description;

    @Column(name = "startTime")
    private LocalDateTime startTime;

    @Column(name = "endTime")
    private LocalDateTime endTime;

    @Enumerated(value = EnumType.STRING)
    @Column(name = "status")
    private ReservationStatus status;

    @Column(name = "userId")
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private User user;

    @Column(name = "roomId")
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Room room;
}
