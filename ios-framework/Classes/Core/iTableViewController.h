//
//  iTableViewController.h
//  iPadFramework
//
//  Created by Nami on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface iTableViewController : UITableViewController {
	    NSMutableArray* sectionList;	
}

@property (retain, nonatomic, readwrite) NSMutableArray* sectionList;


@end
