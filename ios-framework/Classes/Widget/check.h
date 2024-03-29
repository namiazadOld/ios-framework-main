//
//  iSwitch.h
//  iPadFramework
//
//  Created by Nami on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"
#import "Bool.h"


@interface check : baseControl {
	UISwitch* switchable;
	BindableObject* statusBindableObject;
}

@property (nonatomic, retain) UISwitch* switchable;
@property (nonatomic, retain) Bool* status;
@property (nonatomic, retain) BindableObject* statusBindableObject;

@end
