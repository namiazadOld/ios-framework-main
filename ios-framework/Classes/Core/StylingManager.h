//
//  StylingManager.h
//  iPadFramework
//
//  Created by Nami on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iBaseControl.h"
#import "Constants.h"


@interface StylingManager : NSObject {
	
}

+(CGRect) styleRectangle: (iBaseControl*)control container:(iBaseControl*)parent;
+(void) regenerateLineNos: (iBaseControl*) container;
+(void) orderWidgets: (iBaseControl*)container;
+(BOOL) ordered;

@end
