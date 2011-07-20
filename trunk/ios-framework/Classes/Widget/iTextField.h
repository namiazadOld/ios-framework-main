//
//  iTextField.h
//  iPadFramework
//
//  Created by Nami on 3/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iCustomControl.h"
#import "iTextBox.h"
#import "iLabel.h"
#import "iView.h"


@interface iTextField : iCustomControl {
	iLabel* label;
	iTextBox* textBox;
}

@property (nonatomic, retain) iLabel* label;
@property (nonatomic, retain) iTextBox* textBox;

@end
