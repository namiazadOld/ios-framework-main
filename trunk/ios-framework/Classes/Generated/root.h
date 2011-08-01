/*
 *  root.h
 *  iPadFramework
 *
 *  Created by Nami on 1/28/11.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */


#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import "NSStack.h"
#import "NullObject.h"
#import "NSSelector.h"	
#import "iCustomControl.h"
#import "Utilities.h"
#import "Scope.h"
#import "iView.h"
#import "Callback.h"
#import "StylingManager.h"
#import "UIStyle.h"
#import "Num.h"
#import "DateTime.h"
#import "String.h"
#import "Function1.h"
#import "NSObject+mobl.h"

@interface root : iView{
	UIWindow *window;
}

@property (nonatomic, retain) UIWindow *window;

@end
