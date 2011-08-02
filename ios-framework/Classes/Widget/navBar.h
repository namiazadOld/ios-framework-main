//
//  iHeader.h
//  iPadFramework
//
//  Created by Nami on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"



@interface navBar : baseControl {
	
	NSString* title;
	UIBarButtonItem* rightButton;
	UIBarButtonItem* leftButton;
	BindableObject* titleBindableObject;
	baseControl* container;
}

@property (retain) NSString* title;
@property (retain) UIBarButtonItem* rightButton;
@property (retain) UIBarButtonItem* leftButton;
@property (nonatomic, retain) BindableObject* titleBindableObject;
@property (nonatomic, retain) baseControl* container;

-(void) setButtons;
-(baseControl*) getHolder;

@end
