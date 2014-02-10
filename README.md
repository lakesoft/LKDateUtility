LKDateUtility
=============

Date utility library

##Usage

###LKDateTemplate

	text = [LKDateTemplate convertWithTemplate:@"%yyyy-%MM-%dd (%eee) %HH:%mm:%ss %a"];
	// 2014-02-10 (Mon) 22:34:01

Template's keywords are defined in LKDateTemplate.plist.
Keyword list infomation APIs are available (e.g. +keywordTitleAtIndex:).

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

