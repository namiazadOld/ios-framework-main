//
//  iNavigationButton.h
//  iPadFramework
//
//  Created by Nami on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iBaseControl.h"
#import "iHeader.h"


@interface iNavigationButton : iBaseControl {
	UIBarButtonItem* button;
	BindableObject* titleBindableObject;
	iHeader* header;
	
}

@property (nonatomic, retain) UIBarButtonItem* button;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) BindableObject* titleBindableObject;
@property (nonatomic, retain) iHeader* header;

@end
