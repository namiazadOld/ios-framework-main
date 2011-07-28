//
//  CustomDate.h
//  ipad-framework-main
//
//  Created by Nami on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+mobl.h"
@class Num;

@interface DateTime : NSObject {
	NSDate* _date;
}

@property (nonatomic, retain) NSDate* _date;
+(DateTime*) create: (Num*)year arg:(Num*)month arg:(Num*)day arg:(Num*)hour arg:(Num*)minute arg:(Num*)second arg:(Num*)ms;
+(DateTime*) parse: (NSString*)s;
+(DateTime*) fromTimestamp: (Num*)timestamp;

-(Num*) getFullYear; 
-(Num*) getMonth;
-(Num*) getDate;
-(Num*) getDay;
-(Num*) getHours;
-(Num*) getMinutes;
-(Num*) getSeconds;
-(Num*) getMilliseconds;
-(Num*) setFullYear: (Num*) y;
-(Num*) setMonth: (Num*) m;
-(Num*) setDate: (Num*) d;
-(NSString*) toString;
-(NSString*) toDateString;
-(Num*) getTime;

@end
