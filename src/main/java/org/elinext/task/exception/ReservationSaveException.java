package org.elinext.task.exception;

public class ReservationSaveException extends RuntimeException {
    public ReservationSaveException() {
        super();
    }

    public ReservationSaveException(String message) {
        super(message);
    }

    public ReservationSaveException(String message, Throwable cause) {
        super(message, cause);
    }

    public ReservationSaveException(Throwable cause) {
        super(cause);
    }
}
