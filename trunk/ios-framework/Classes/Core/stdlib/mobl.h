//
//  mobl.h
//  ipad-framework-main
//
//  Created by Nami on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"
@class DateTime;


@interface mobl : NSObject {
	
}

+(void) add: (Entity*) newItem;
+(DateTime*) now;

@end
