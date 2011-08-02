//
//  iMaster.h
//  ipad-framework-main
//
//  Created by Nami on 6/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"
#import "detail.h"
#import "BindableObject.h"
#import "customControl.h"


@interface master : baseControl {
	UIViewController* masterView;
}

@property (nonatomic, retain) UIViewController* masterView;

@end
