# Pre-work - *tip*

**tip** is a tip calculator application for iOS.

Submitted by: **Timothy Nguyen**

Time spent: **10** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [X] Settings page to change the default tip percentage.
* [X] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Added a bill split field
- [X] Added a custom tip percentage text field
- [X] Added launch screen styling and app icon
- [X] Forced dark mode for stylistic purposes


## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/3J6swiI.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

The application was rather straight-forward to create with the given instructions. There is also a bug that I have not been
able to get rid of. The main text field for the bill amount works correctly, except when there is a comma in it. With a comma,
the calculations are passed a value of 0.0, so the computations are not as expected. Also, I have not added constraints to get
the application to scale correctly on different display sizes yet.

## License

    Copyright 2020 Codepath

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
