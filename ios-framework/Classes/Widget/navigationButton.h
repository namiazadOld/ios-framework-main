//
//  iNavigationButton.h
//  iPadFramework
//
//  Created by Nami on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"
#import "navBar.h"
#import "customControl.h"


@interface navigationButton : baseControl {
	UIBarButtonItem* button;
	BindableObject* titleBindableObject;
	navBar* navHdr;
	UIPopoverController* contextMenu;
	
}

@property (nonatomic, retain) UIBarButtonItem* button;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) BindableObject* titleBindableObject;
@property (nonatomic, retain) navBar* navHdr;
@property (nonatomic, retain) UIPopoverController* contextMenu;

-(void) initializeContexMenu: (customControl*) content;

@end
