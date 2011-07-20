//
//  iNumField.h
//  iPadFramework
//
//  Created by Nami on 5/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iTextBox.h"


@interface iNumField : iTextBox {
	BindableObject* numberBindableObject;
}

//@property (nonatomic, retain) NSNumber* number;
//
//-(NSNumber*) getNumberFromText;

@property (nonatomic, assign) float number;
@property (nonatomic, retain) BindableObject* numberBindableObject;

-(NSNumber*) getNumberFromText;


@end
