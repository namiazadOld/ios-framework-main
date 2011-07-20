//
//  iSection.h
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iBaseControl.h"
#import "iTable.h"

@interface iSection : iBaseControl {
	NSMutableArray* itemList;
	NSString* title;
	BindableObject* titleBindableObject;	
}

@property (nonatomic, retain) NSMutableArray* itemList;
@property (retain) NSString* title;
@property (nonatomic, retain) BindableObject* titleBindableObject;
@property (nonatomic, retain) iTable* table;

@end
