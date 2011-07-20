//
//  iSplitView.h
//  ipad-framework-main
//
//  Created by Nami on 6/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iBaseControl.h"
#import "iMaster.h"
#import "iDetail.h"
#import "iView.h"

//Because of restrictions of spliview to be used as inner control, we use our own custom split view.
@interface iSplitView : iBaseControl {
    UIViewController* splitView;
	iMaster* master;
	iDetail* detail;
}

@property (nonatomic, retain) UIViewController* splitView;
@property (nonatomic, retain) iMaster* master;
@property (nonatomic, retain) iDetail* detail;

@end
