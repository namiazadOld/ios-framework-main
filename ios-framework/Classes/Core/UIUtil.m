//
//  UIUtil.m
//  ipad-framework-main
//
//  Created by Nami on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIUtil.h"
#import "Utilities.h"
#import "iView.h"
#import "StylingManager.h"


@implementation UIUtil

+(void) message: (NSString*) content arg: (NSString*) title
{
	[Utilities ShowError:self title:title content:content];
}

+(void) dialog: (iCustomControl*) content
{
	iView* modalView = [[iView alloc] init];
	
	[modalView render:[[NSMutableArray alloc] init] container:NULL elements:NULL];
	[modalView finilize];
	
	[content render:[[NSMutableArray alloc] init] container:modalView elements:NULL];
	[content finilize];
	[modalView addBodyControl:content];
	
	modalView.viewController.navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
	modalView.viewController.navigationController.view.backgroundColor = [UIColor whiteColor];
	[[Utilities CurrentView] presentModalViewController:modalView.viewController.navigationController animated:YES]; 
	
	[StylingManager orderWidgets:modalView];
}

+(void) dismiss
{
	[[Utilities CurrentView] dismissModalViewControllerAnimated:YES];
}

@end
