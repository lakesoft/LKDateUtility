LKDateUtility
=============

Date utility library

##Usage

###LKDateWeekUtility

    // weekday: 1(Sun) - 7(Sat)
    NSString* desc = [LKDateWeekUtility descriptionForWeekday:2];       // @"Monday"
    NSString* desc = [LKDateWeekUtility shortDescriptionForWeekday:2];  // @"Mon"

The descriptins of weekday are localized by NSDateFormatter.

below symbols are availables:

    typedef NS_ENUM(NSInteger, LKDateWeekday) {
      LKDateWeekdaySunday     = 1,
      LKDateWeekdayMonday     = 2,
      LKDateWeekdayTuesday    = 3,
      LKDateWeekdayWednesday  = 4,
      LKDateWeekdayThursday   = 5,
      LKDateWeekdayFriday     = 6,
      LKDateWeekdaySaturday   = 7
    };
