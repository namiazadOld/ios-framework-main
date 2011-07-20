//
//  iMaster.h
//  ipad-framework-main
//
//  Created by Nami on 6/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iBaseControl.h"
#import "iDetail.h"
#import "BindableObject.h"
#import "iCustomControl.h"


@interface iMaster : iBaseControl {
	UIViewController* masterView;
}

@property (nonatomic, retain) UIViewController* masterView;

@end
