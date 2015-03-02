LKDateUtility
=============

Date utility library

##Usage

###LKDateTemplate

	text = [LKDateTemplate convertWithTemplate:@"%yyyy-%MM-%dd (%eee) %HH:%mm:%ss %a"];
	// 2014-02-10 (Mon) 22:34:01

Template's keywords are defined in LKDateTemplate.plist.
Keyword list infomation APIs are available (e.g. +keywordTitleAtIndex:).

###LKDateWeekUtility (1)

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


###LKDateWeekUtility (2)

	+ (NSInteger)weeksFromFirstMondayIn1970ForDate:(NSDate*)date;

This method return week number of from 1970/01/05 (Monday). The number start with 0 when the date is '1970/01/05'.

	examples:
	1970/01/05(Mon) => 0
	   :
 	2014/05/24(Sat) => 2315
 	2014/05/25(Sun) => 2315
 	2014/05/26(Mon) => 2316   updated
 	2014/05/27(Tue) => 2316
 	2014/05/28(Wed) => 2316
 	2014/05/29(Thu) => 2316
 	2014/05/30(Fri) => 2316
 	2014/05/31(Sat) => 2316
 	2014/06/01(Sun) => 2316
 	2014/06/02(Mon) => 2317   updated
	   :

You can use it for calculating by weekly (mon-sun).




