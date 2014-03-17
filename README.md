An easy way to integrate Dropbox sync into your projecxt. Send a string, and get a string. It's just that easy to work with Dropbox. 

### Installation

Drag the dropbox iOS framework into your Xcode project. MFDropboxManager will install the rest through Cocoa Pods. 

	pod install 'MFDropboxManager'

### Optional

If you're not using Cocoa Pods, then follow the instructions on how to install dropbox into your project, and drag the MFDropboxManager.(h,m) files into your project. 

It's just that easy. 

### Instructions

First, make sure you have your API key and Secret in your App Delegate.

	DBAccountManager *accountManager = [[DBAccountManager alloc] initWithAppKey:@"8top7d0i4cn0uf9"
                                                                         secret:@"q5nuhocl327a9ev"];
    [DBAccountManager setSharedManager:accountManager];

We also need to add another method to our App Delegate, so Dropbox can redirect back to our app once a user logs in. 

	- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url 
										   sourceApplication:(NSString *)sourceApplication 
										   		  annotation:(id)annotation
	{
	    DBAccount *account = [[DBAccountManager sharedManager] handleOpenURL:url];
	    if (account) {
	        NSLog(@"App linked successfully!");
	        return YES;
	    }
	    return NO;
	}

That's it for the boiler plate App Delegate code. Now, make sure you link up the user's dropbox account using this method: 
	
	[[MFDroboxManager sharedManager] linkAccountFromViewController:viewController]; 

It is best to call this method in an IBAction or similar button pressed. You definitely don't want to call it when the user doesn't want to set up Dropbox. They'll get confused and most likely delete your app. 

Once we have an account linked, we add a name for the child file we'll create on the user's dropbox. In MFDropboxManager. change #define to what you want your folder to be called: 

	#define CHILD_PATH @"some_folder.txt"

Boom! You've successfully set up a file on the user's dropbox account. 

To sync the file, simply call this method: 

	- (void)syncFileWithString:(NSString *)string;

And to get the contents of our file, call this method: 
	
	- (NSString *)contentsOfFile;

It's time to get your dropbox on!

### Contact

Michael Fellows
michael.fellows12@gmail.com




