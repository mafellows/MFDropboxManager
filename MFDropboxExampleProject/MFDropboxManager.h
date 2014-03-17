//
//  MFDropboxManager.h
//  MFDropboxExampleProject
//
//  Created by Michael Fellows on 3/17/14.
//  Copyright (c) 2014 Michael Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DBAccount; 

@interface MFDropboxManager : NSObject

+ (instancetype)sharedManager;


/*
 *  Syncs a string provided with the dropbox file system
 *  CSV string recommended
 */
- (void)syncFileWithString:(NSString *)string;

/*
 *  @return contents of the Dropbox file for the given path
 */
- (NSString *)contentsOfFile;

/*
 *  @return YES if we have permission to access the user's Dropbox account
 */
- (BOOL)accountLinked;

/*
 *  Link the user's dropbox account with our app
 *
 *  @param View controller that we are linking the account through. Dropbox will
 *         return the user back to this view controller once authorized.
 */
- (void)linkAccountFromController:(UIViewController *)controller;


/*
 *  Class method to get the user's Dropbox account
 *  @return user's dropbox account
 */

- (DBAccount *)account;

@end
