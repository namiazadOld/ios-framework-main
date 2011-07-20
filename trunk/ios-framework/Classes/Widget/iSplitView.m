//
//  iSplitView.m
//  ipad-framework-main
//
//  Created by Nami on 6/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iSplitView.h"
#import "StylingManager.h"

@implementation iSplitView
@synthesize splitView, master, detail;

-(iBaseControl*) render: (NSMutableArray*) arguments container: (iBaseControl*)parent elements: (iBaseControl*) _elements
{
	self.splitView = [[UISplitViewController alloc] init];
	self.splitView.view.backgroundColor = [UIColor blackColor];
	
	self.detail = [[iDetail alloc] init];
	self.master = [[iMaster alloc] init];
	UINavigationController *masterNav = [[UINavigationController alloc] initWithRootViewController:self.master.masterView];
	UINavigationController *detailNav = [[UINavigationController alloc] initWithRootViewController:self.detail.detailView];
	[masterNav setNavigationBarHidden:YES];
	[detailNav setNavigationBarHidden:YES];
		
	[super render:arguments container: parent elements:_elements];
	
	//masterNav.view.frame = [self.master getFrame];
	//detailNav.view.frame = [self.detail getFrame];
	
	[self.splitView.view addSubview:masterNav.view];
	[self.splitView.view addSubview:detailNav.view];
	
	return self;
}

-(void) initializeMaster: (iCustomControl*) content
{
	[self.master render:[[NSMutableArray alloc] init] container:self elements:NULL];
	[content render:[[NSMutableArray alloc] init] container:self.master elements:NULL];
	[content finilize];
	[self.master addBodyControl:content];
	[self addBodyControl:self.master];
}

-(void) initializeDetail: (iCustomControl*) content
{
	[self.detail render:[[NSMutableArray alloc] init] container:self elements:NULL];
	[content render:[[NSMutableArray alloc] init] container:self.detail elements:NULL];
	[content finilize];
	[self.detail addBodyControl:content];
	[self addBodyControl:self.detail];
}

-(void) manageArgument: (BindableObject*)bo at:(int)index
{
	[super manageArgument:bo at:index];
	switch (index) {
		case 0:
		{
			[self initializeMaster:(iCustomControl*)bo.value];
			break;
		}
		case 1:
		{
			[self initializeDetail:(iCustomControl*)bo.value];
			break;
		}
		case 2:
		{
			[self setControlStyle:(UIStyle*)bo.value];
			break;
		}
		default:
			break;
	}	
}

-(CGRect) getFrame
{
	return self.splitView.view.frame;
}

-(void)setFrame:(CGRect)frame
{
	float ratioMaster = 268.0/768.0;
	float ratioDetail = 499.0/768.0;
	self.splitView.view.frame = frame;
	self.master.masterView.view.frame = CGRectMake(0, 0, ratioMaster * frame.size.width, frame.size.height);
	self.detail.detailView.view.frame = CGRectMake(0, 0, ratioDetail * frame.size.width, frame.size.height);	

	self.master.masterView.navigationController.view.frame = CGRectMake(0, 0, ratioMaster * frame.size.width, frame.size.height);
	self.detail.detailView.navigationController.view.frame = CGRectMake(ratioMaster * frame.size.width + 2, 0, ratioDetail * frame.size.width, frame.size.height);
	
}

-(UIView*) getView
{
	return self.splitView.view;
}

@end
