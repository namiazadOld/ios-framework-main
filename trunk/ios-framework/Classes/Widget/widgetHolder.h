//
//  iView.h
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"
#import "empty.h"
#import "customControl.h"

@interface widgetHolder : baseControl {
	UINavigationController* navController;
}

@property (nonatomic, retain) UINavigationController* navController;

@end
