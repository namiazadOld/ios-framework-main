//
//  UIUtil.h
//  ipad-framework-main
//
//  Created by Nami on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "customControl.h"


@interface UIUtil : NSObject {

}

+(void) message: (NSString*) content arg: (NSString*) title;
+(void) dialog: (customControl*) content;

@end
