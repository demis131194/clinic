package org.elinext.task.util;

import java.time.LocalDateTime;

public class TimeUtil {
    public static boolean isBetween(LocalDateTime lt, LocalDateTime startTime, LocalDateTime endTime) {
        return (lt.isAfter(startTime) || lt.isEqual(startTime)) && (lt.isBefore(endTime) || lt.isEqual(endTime));
    }

    public static boolean isNotBetween(LocalDateTime lt, LocalDateTime startTime, LocalDateTime endTime) {
        return lt.isBefore(startTime) || lt.isAfter(endTime);
    }

    public static boolean isCross(LocalDateTime firstStart, LocalDateTime firstEnd,
                                  LocalDateTime secondStart, LocalDateTime secondEnd) {
        return TimeUtil.isBetween(firstStart, secondStart, secondEnd)
                || TimeUtil.isBetween(firstEnd, secondStart, secondEnd);
    }
}