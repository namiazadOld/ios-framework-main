//
//  iItem.h
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"
#import "group.h"
#import "NSSelector.h"



@interface item : baseControl{
	NSString* title;
	UITableViewCell* cell;
	BindableObject* titleBindableObject;
	NSSelector* onClick;

}

@property (retain) NSString* title;
@property (nonatomic, retain) UITableViewCell* cell;
@property (nonatomic, retain) BindableObject* titleBindableObject;
@property (nonatomic, retain) group* table;
@property (nonatomic, retain) NSSelector* onClick;

@end
