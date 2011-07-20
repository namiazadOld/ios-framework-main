//
//  iTabSet.h
//  iPadFramework
//
//  Created by Nami on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iBaseControl.h"


@interface iTabSet : iBaseControl {
	UITabBarController* tabController;
}

@property (retain) UITabBarController* tabController;

-(void) initializeTabPages: (NSArray*) tabPages;
@end
