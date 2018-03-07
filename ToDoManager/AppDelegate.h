//
//  AppDelegate.h
//  ToDoManager
//
//  Created by Alias George on 1/30/18.
//  Copyright © 2018 Alias George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

