//
//  iTabSet.h
//  iPadFramework
//
//  Created by Nami on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"
@class Array;


@interface tabSet : baseControl {
	UITabBarController* tabController;
}

@property (retain) UITabBarController* tabController;

-(void) initializeTabPages: (Array*) tabPages;
@end
