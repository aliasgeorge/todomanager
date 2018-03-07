//
//  MyUIViewController.h
//  ToDoManager
//
//  Created by Alias George on 1/30/18.
//  Copyright © 2018 Alias George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGHandlesMOC.h"
#import "AGHandlesToDoEntity.h"
@interface MyUIViewController : UIViewController<AGHandlesMOC,AGHandlesToDoEntity>

-(void)receiveMOC:(NSManagedObjectContext *)incomingMOC;
-(void)receiveToDoEntity:(ToDoEntity *)incomingToDoEntity;


@end
