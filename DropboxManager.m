//
//  DropboxManager.m
//  Daily Do
//
//  Created by Michael Fellows on 3/17/14.
//  Copyright (c) 2014 Michael Fellows. All rights reserved.
//

#import "DropboxManager.h"
#import <Dropbox/Dropbox.h>

#define CHILD_PATH @"DailyDo.txt"

@implementation DropboxManager

- (id)init
{
    self = [super init];
    if (self) {
        // Set shared file system
        [DBFilesystem setSharedFilesystem:[self fileSystem]];
    }
    return self;
}

+ (instancetype)sharedManager
{
    return [[self alloc] init];
}

- (DBFilesystem *)fileSystem
{
    return [[DBFilesystem alloc] initWithAccount:[self account]];
}

- (DBPath *)path
{
    return [[DBPath root] childPath:CHILD_PATH];
}

#pragma mark - File

- (void)syncFileWithString:(NSString *)string
{
    // Get the user's file system
    DBPath *path = [self path];
    
    DBFile *file;
    DBError *error = nil;
    DBFileInfo *info = [[DBFilesystem sharedFilesystem] fileInfoForPath:path error:&error];
    if (info) {
        // file exists!
        file = [[DBFilesystem sharedFilesystem] openFile:path error:nil];
    } else {
        // File does not exit -> create the file
        file = [[DBFilesystem sharedFilesystem] createFile:path error:nil];
    }
    BOOL success = [file writeString:string error:nil];
    
    if (success) {
        NSLog(@"Succesfully updated Dropbox file");
    } else {
        NSLog(@"Unable to write to the file.");
    }
}

- (NSString *)contentsOfFile
{
    DBFile *file = [[DBFilesystem sharedFilesystem] openFile:[self path] error:nil];
    return [file readString:nil];
}

#pragma mark - Account

- (DBAccount *)account
{
    return [[DBAccountManager sharedManager] linkedAccount];
}

- (BOOL)accountLinked
{
    DBAccount *account = [[DBAccountManager sharedManager] linkedAccount];
    
    if (account) {
        return YES;
    }
    return NO;
}

- (void)linkAccountFromController:(UIViewController *)controller
{
    [[DBAccountManager sharedManager] linkFromController:controller];
}

@end
