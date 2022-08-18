# personal_finance_tracking_ui

A semi-functional recreation of the UI for a personal finance app, re-created from 3rd party designs.
A personal exercise to demonstrate my ability to recreate an app UI from a design, work through common pitfalls in creating the UI in Flutter and produce an appealing end result.

The app contains the Home screen. The whole screen is scrollable. It contains a horizontally scrolling ListView of payment cards.
The cards are created with my custom PaymentCardWidget, which takes a PaymentCard model, so cards are dynamically created from the data supplied.

I created a custom widget for the Transaction buttons and Transaction list items, as there is a gradient border from top to bottom giving the top of the button a three dimensional appearance.
There were no pre-made/pre-existing Flutter Widgets for this particular style.

I located and incorporated the free version of the fonts to the original design. (The only difference is the free versions are very slightly different font weights to the original, but you would probably not notice unless you looked closely.) I settled with the free fonts as this is just an exercise.
I recreated/drew the icons as vector images and imported them as svg images.

I particularly like the bottom icon bar at the bottom with its rounded corners and semi-transparent colour.

The original app design is by Dmitry Mikhaylov
https://dribbble.com/shots/18516064-Banking-app-Dark-Mode-Light-Mode

Here is a screenshot of his original design.

<img src="https://github.com/c0ff33-b34n/personal_finance_ui_flutter/blob/master/originalapp.jpg" width="400">

I have implemented the dark UI version of the Home screen and here are screenshots of my implementation.
The backgrounds for the payment cards are slightly different to the original and I have created them with multi-layered, semi-transparent colour gradients.

<img src="https://github.com/c0ff33-b34n/personal_finance_ui_flutter/blob/master/finishedapp1.png" width="400">
<img src="https://github.com/c0ff33-b34n/personal_finance_ui_flutter/blob/master/finishedapp2.png" width="400">