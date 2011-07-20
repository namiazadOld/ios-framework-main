//
//  iView.h
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iBaseControl.h"
#import "iEmptyWidget.h"
#import "iCustomControl.h"

@interface iView : iBaseControl {
	UINavigationController* navController;
}

@property (nonatomic, retain) UINavigationController* navController;

@end
