//
//  iSplitView.h
//  ipad-framework-main
//
//  Created by Nami on 6/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseControl.h"
#import "master.h"
#import "detail.h"
#import "widgetHolder.h"

//Because of restrictions of spliview to be used as inner control, we use our own custom split view.
@interface splitView : baseControl {
    UIViewController* splitView;
	master* master;
	detail* detail;
}

@property (nonatomic, retain) UIViewController* splitView;
@property (nonatomic, retain) master* master;
@property (nonatomic, retain) detail* detail;

@end
