//
//  iWhen.h
//  ipad-framework-main
//
//  Created by Nami on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iBaseControl.h"
#import "BindableObject.h"
#import "iCustomControl.h"


@interface iWhen : iCustomControl {
	iCustomControl* when;
	iCustomControl* elseWhen;
	BindableObject* conditionBindableObject;
}

@property (nonatomic, retain) iCustomControl* when;
@property (nonatomic, retain) iCustomControl* elseWhen;
@property (assign) BOOL condition;
@property (nonatomic, retain) BindableObject* conditionBindableObject;

@end
