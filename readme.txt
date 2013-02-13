This BCMock stuff is only an academical exercice.
Use it only for learning purpose.

It's highly inspire on OCMock.
This is also clearly myself re inventing the wheel. 
I wanted to do a "stub" and see how it can be done.
The first commit as only one method : 
 [mock when:@selector(oneParameter:) jumpTo:@selector(hello) On:other];
This is far from OcMock and will never compete, thats not the idea, the idea is to keep it simple, light, few explicit functionality like :

-  test objects parsing using local files instead of webservices.

For now , it's a beginning it works like this : 

    Other *other = [[Other alloc] init];
    BCMock *mock = [[BCMock alloc] initWithClass:[Test class]];
    [mock when:@selector(oneParameter:) jumpTo:@selector(hello) On:other];           
    [mock oneParameter:@"test"];

What does that mean ???

I create my mock with a class, Test, so when I will call method on the object mock, there will be redirect to an object Test, meaning :
 
[mock oneParameter:@"test"];

is equivalent to : 

Test *test = [[Test alloc] init];
[test oneParameter:@"test"];

But here there is another line : 

 [mock when:@selector(oneParameter:) jumpTo:@selector(hello) On:other];       

Means : when (and if) I call oneParameter: on my mock object, instead I will call "hello" on the object "other". 

That helps me resolve my user story, cause I can call that on a mock of my service object and say no you won't call parsingWithResultOfRequest: after all, you will call parseMyLocalFile:

This is a work in progress, if you have any suggestion send me an email at boris.charpentier@gmail.com

Copyright © 2013, Boris Charpentier

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 
