//
//  iButton.h
//  iPadFramework
//
//  Created by Nami on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"

@interface button : baseControl {
	UIButton* btn;
	BindableObject* titleBindableObject;
}

@property (nonatomic, retain) UIButton* btn;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) BindableObject* titleBindableObject;

@end
