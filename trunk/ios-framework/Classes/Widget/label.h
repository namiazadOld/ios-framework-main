//
//  iLabel.h
//  iPadFramework
//
//  Created by Nami on 3/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"
#import "NullObject.h"


@interface label : baseControl {
	UILabel* lbl;
	BindableObject* textBindableObject;
}

@property (nonatomic, retain) UILabel* lbl;
@property (nonatomic, retain) NSString* text;
@property (nonatomic, retain) BindableObject* textBindableObject;

@end
