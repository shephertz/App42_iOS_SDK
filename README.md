App42_iOS_SDK
=============

App42 Cloud API Client SDK files for iOS

__Integrate in Swift Project__

* Import your Objective C framework by dragging and dropping the framework into an Xcode 6 Swift project.
* Create a new Objective C file in your project (File->New->File [Objective C for iOS]).
* Accept the prompt (agree) to create a bridging header file between Objective C and Swift.
* Delete your newly created Objective C file but retain the bridging header file ${YOURPROJ}-Bridging-Header.h.
* In the Bridging header file, import your framework using the standard Objective C import syntax (e.g. #import <Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>).
* This relinquishes the need to perform an import Shephertz_App42_iOS_API statement in your AppDelegate.swift file. You can now write code that utilizes whatever framework as long as it is imported using the bridging header. It is available throughout your project's Swift files.

__Third Party Libraries__

* [SBJson](http://www.sbjson.org/api/3.2/)
```
BSD License
```
* [Base64Transcoder](https://github.com/couchbaselabs/ios-oauthconsumer/blob/master/Crypto/Base64Transcoder.h)
```
Created by Jonathan Wight on Tue Mar 18 2003.
Copyright (c) 2003 Toxic Software. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
  -The above copyright notice and this permission notice shall be included in
  -all copies or substantial portions of the Software.
```

