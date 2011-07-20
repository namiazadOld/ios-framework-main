//
//  iCustomControl.h
//  iPadFramework
//
//  Created by Nami on 3/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iBaseControl.h"


@interface iCustomControl : iBaseControl{
	iBaseControl* container;
}

@property (nonatomic, retain) iBaseControl* container;



@end
