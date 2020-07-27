package org.elinext.test.model;

import javax.persistence.*;

@Entity
@Table(name = "rooms")
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "roomId")
    private Long roomId;

    @Column(name = "roomName")
    private String roomName;

    @Enumerated(value = EnumType.STRING)
    @Column(name = "status")
    private RoomStatus roomStatus;
}
