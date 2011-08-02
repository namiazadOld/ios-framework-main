//
//  StylingManager.h
//  iPadFramework
//
//  Created by Nami on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"
#import "Constants.h"


@interface StylingManager : NSObject {
	
}

+(CGRect) styleRectangle: (baseControl*)control container:(baseControl*)parent;
+(void) regenerateLineNos: (baseControl*) container;
+(void) orderWidgets: (baseControl*)container;
+(BOOL) ordered;

@end
