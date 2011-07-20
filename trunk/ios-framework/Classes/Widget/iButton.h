//
//  iButton.h
//  iPadFramework
//
//  Created by Nami on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iBaseControl.h"

@interface iButton : iBaseControl {
	UIButton* button;
	BindableObject* titleBindableObject;
}

@property (nonatomic, retain) UIButton* button;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) BindableObject* titleBindableObject;

@end
