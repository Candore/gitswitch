## Welcome to GitSwitch

A simple script to switch between two git user accounts and ssh defaults. 
### Secondary user initialization

If you are creating a secondary github user keys for the first time, 
execute `sh init.sh`. This will prompt you to enter your secondary user info to
create ssh private and public keys for the newly created user.

Once the key is created, the program automatically switches the secondary user as the default user. 
[GitHub Reference](https://scriptingosx.com/2016/05/build-an-application-to-run-a-shell-command-in-xcode-and-swift-part-2)

Remember to copy the generated id_rsa key to your secondary github account's settings.

### Git Switch
If you have created a secondary gituser info and if you frequently switch 
between users, then add `gswitch` to the end of the file, (line #31 on [gswitch](https://github.com/Candore/gitswitch/blob/master/gswitch.sh)) , and execute the following
command from command line - `sh gswitch.sh`

### Support or Contact
email : kavin@kannan.io
