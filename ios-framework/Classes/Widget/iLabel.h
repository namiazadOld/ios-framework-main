//
//  iLabel.h
//  iPadFramework
//
//  Created by Nami on 3/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iBaseControl.h"
#import "NullObject.h"


@interface iLabel : iBaseControl {
	UILabel* label;
	BindableObject* textBindableObject;
}

@property (nonatomic, retain) UILabel* label;
@property (nonatomic, retain) NSString* text;
@property (nonatomic, retain) BindableObject* textBindableObject;

@end
