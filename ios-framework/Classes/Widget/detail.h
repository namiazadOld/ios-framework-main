//
//  iDetail.h
//  ipad-framework-main
//
//  Created by Nami on 6/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"
#import "BindableObject.h"

@interface detail : baseControl {
	UIViewController* detailView;
}

@property (nonatomic, retain) UIViewController* detailView;


@end
