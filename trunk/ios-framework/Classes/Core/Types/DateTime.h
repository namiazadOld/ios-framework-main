//
//  CustomDate.h
//  ipad-framework-main
//
//  Created by Nami on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Object.h"


@interface DateTime : Object {
	NSDate* date;
}

@property (nonatomic, retain) NSDate* date;
+(DateTime*) create: (float)year arg:(float)month arg:(float)day arg:(float)hour arg:(float)minute arg:(float)second arg:(float)ms;
-(float) getDay; 

@end
