//
//  BindableObject.m
//  iPadFramework
//
//  Created by Nami on 2/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BindableObject.h"
#import "baseControl.h"


@implementation BindableObject
@synthesize value = _bv, listeners, evaluator, removeFromListener;

-(void) initFields
{
	if (listeners == nil)
		listeners = [[NSMutableArray alloc] init];
}


-(BindableObject*) initializeWithValue: (NSObject*) _value
{
	[self initFields];
	[self setValue:_value];
	return self;
}

-(void) addListener: (id) listener
{
	[self.listeners addObject:listener];
}

-(void) notifyListeners
{
	int i = 0;
	while (i < [self.listeners count])
	{
		if ([[self.listeners objectAtIndex:i] removeFromListener])
			[self.listeners removeObjectAtIndex:i];
		else
			i++;
	}
	
	for (id<Notifiable> control in self.listeners)
		[control changeNotification:self];
}

-(NSObject*) value
{
	return _bv;
}

-(void) setValue:(NSObject *)v
{
	@synchronized(self)
	{
		[self initFields];
		if (_bv != NULL && v != NULL && [v isKindOfClass:[baseControl class]])
			[baseControl ChangeControl:(baseControl*)_bv to:(baseControl*)v];
		_bv = v;
		[self notifyListeners];
	}
}

-(void) changeNotification:(BindableObject*) sender
{
	if (self.evaluator == NULL)
		return;
	[self setValue:[self.evaluator evaluate]];
}

@end
