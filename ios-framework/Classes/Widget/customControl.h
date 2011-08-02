//
//  iCustomControl.h
//  iPadFramework
//
//  Created by Nami on 3/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"


@interface customControl : baseControl{
	baseControl* container;
}

@property (nonatomic, retain) baseControl* container;



@end
