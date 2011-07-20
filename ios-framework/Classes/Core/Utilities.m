//
//  Utilities.m
//  iPadFramework
//
//  Created by Nami on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Utilities.h"
#import "iBaseControl.h"
#import "Constants.h"
#import "Tuple1.h"
#import "Tuple2.h"
#import "Tuple3.h"
#import "Tuple4.h"
#import "Tuple5.h"
#import "iCustomControl.h"


@implementation Utilities

static UIViewController* currentView;
static NSManagedObjectModel* managedObjectModel;
static NSManagedObjectContext* managedObjectContext;

+(void) ShowError: (id)sender title: (NSString*)title content: (NSString*)content
{
	UIAlertView *someError = [[UIAlertView alloc] 
							  initWithTitle: title 
							  message: content 
							  delegate:sender 
							  cancelButtonTitle: @"Ok" 
							  otherButtonTitles: nil];
	[someError show];
	[someError release];

}

+(void) AddControl:(iBaseControl*) widget ToContainer: (iBaseControl*) container
{

	
	UIView* view = [widget getView];
	
	if (view != NULL)
		[[container getChildrenHolder] addSubview:view];

	[widget parentChanged:container];
	
	
	if (container.currentRole != nil)
	{
		[container.currentRole.children addObject:widget];
		[widget setParentWidget:container.currentRole];
	}
	else
	{
		[container.children addObject:widget];
		[widget setParentWidget:container];
	}
}

+(BindableObject*) InitWithType: (TypedValue*) tv
{
	if ([tv.type isEqualToString:NUM_TYPE])
		return [[BindableObject alloc] initWithNumber:[tv.value floatValue]];

	if ([tv.type isEqualToString:BOOL_TYPE])
		return [[BindableObject alloc] initWithBool:[tv.value boolValue]];
	
	if ([tv.value isKindOfClass:[BindableObject class]])
		return tv.value;
	
	
	return [[BindableObject alloc] initWithValue:tv.value];
}


+(UIViewController*) CurrentView
{
	return currentView;
}

+(void) setCurrentView: (UIViewController*)viewController
{
	[currentView release];
	currentView = [viewController retain];
	[viewController release];
}

+(NSManagedObjectContext*) ManagedObjectContext
{
	return managedObjectContext;
}

+(void) setManagedObjectContext: (NSManagedObjectContext*)_managedObjectContext
{
	managedObjectContext = _managedObjectContext;
}

+(NSManagedObjectModel*) ManagedObjectModel
{
	return managedObjectModel;
}

+(void) setManagedObjectModel: (NSManagedObjectModel*)_managedObjectModel
{
	managedObjectModel = _managedObjectModel;
}

+(id) Tuple: (NSArray*)values
{
	switch ([values count]) {
		case 1:
		{
			return [[Tuple1 alloc] initialize:values];
		}
		case 2:
		{
			return [[Tuple2 alloc] initialize:values];
		}
		case 3:
		{
			return [[Tuple3 alloc] initialize:values];
		}
		case 4:
		{
			return [[Tuple4 alloc] initialize:values];
		}
		case 5:
		{
			return [[Tuple5 alloc] initialize:values];
		}
		default:
			return nil;
	}
}

+(NSString*) StringWithUUID {
	CFUUIDRef	uuidObj = CFUUIDCreate(nil);
	NSString	*uuidString = (NSString*)CFUUIDCreateString(nil, uuidObj);
	CFRelease(uuidObj);
	return [uuidString autorelease];
}

@end
