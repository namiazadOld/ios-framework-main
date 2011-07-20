//
//  Context.m
//  iPadFramework
//
//  Created by Nami on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Context.h"


@implementation Context


static iView* rootView;
static NSMutableDictionary* typeToView; 
static NSMutableArray* stackedView;

+(iView*) rootView
{
	return rootView;
}

+(void) setRootView: (iView*)view
{
	@synchronized(self)
	{
		rootView = [view retain];
		[view release];
	}
}

+(void) addView: (iView*)view withName: (NSString*)name
{
	if (typeToView == NULL)
		typeToView = [[NSMutableDictionary alloc] init];
	
	[typeToView setObject:view forKey:name];
}

+(iView*) getView: (NSString*)name
{
	if (typeToView == NULL)
		return NULL;
	
	return [typeToView objectForKey:name];
}

+(void) bringToFront: (iView*)aView
{
	UINavigationController* navigationController = [rootView.viewController.navigationController retain];
	
	if ([navigationController.viewControllers containsObject:aView.viewController])
		[navigationController popToViewController:aView.viewController animated:YES];
	else
		[navigationController pushViewController:aView.viewController animated:YES];
	[navigationController release];
}

@end
