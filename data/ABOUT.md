## Copyright © 2011-2014 Robert Kooima <robert.kooima@gmail.com>

Edworld is a sandbox interactive built on the Thumb engine. Edworld exposes
Thumb's real-time renderer, in-engine scene editor, and ODE-based rigid body
dynamics simulation.

## Application Controls

    TAB ... Toggle this GUI
    ESC ... Toggle the physics simulation

## GUI Panels

    World .... Load and store world definitions
    Solid .... Create and configure objects
    Joint .... Create and configure joints and motors
    Light .... Create and configure spot lights and sky backgrounds
    Config ... Change the display properties

## Editing Controls

    Left  mouse button ... Select and move entities
    Right mouse button ... Pan the camera

    W A S D ..... Move the camera horizontally
    Q E ......... Move the camera vertically

    Space ....... Deselect the current selection
    Backspace ... Delete the current selection
    I ........... Invert the current selection
    C ........... Clone the current selection

    U ... Undo the last editing operation
    V ... Redo the next editing operation

    T ... Set the transform mode to translation
    R ... Set the transform mode to rotation
    X ... Set the transform constraint to the X plane
    Y ... Set the transform constraint to the Y plane
    Z ... Set the transform constraint to the Z plane

    0 1 2 3 4 5 6 7 8 9 ... Set the transform constraint resolution

    Return ... Center the transform constraint about the origin

    B ... Convert the selected set of entities to a dynamic rigid body
    N ... Convert the selected set of entities to a static non-body
    G ... Grow the current selection to include other entities in selected
          bodies, or entities targeted by selected joints.
    J ... Set the target of the selected joints to the selected body.  To link
          two bodies by a joint, include the joint as a part of the first body
          using B, then select the joint and the second body, and link them
          using J.

