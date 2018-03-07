//
//  MyUINavigationController.h
//  ToDoManager
//
//  Created by Alias George on 1/30/18.
//  Copyright © 2018 Alias George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGHandlesMOC.h"
@interface MyUINavigationController : UINavigationController<AGHandlesMOC>
-(void)receiveMOC:(NSManagedObjectContext *)incomingMOC;
@end
