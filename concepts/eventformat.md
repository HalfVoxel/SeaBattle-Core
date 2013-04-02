Simple outline for the basic structure of the event format.
=========
Each ship would have a list of events. An event could be for example a move or fire order.
During the players turn, each ship would construct a sequence of events consisting of the orders the
player issues during that turn, the lists for all ships would then be sent to the server to be processed.
The resulting event list would be roughly the same but would add several new events which are not orders such as
collision events with other ships or removal of orders (e.g because the ship had already been destroyed at the time the order
would have taken effect).

Example event list for one ship
=========
```
{ type: move, dir: 0}, //Move straight forward
{ type: move, dir: 1}, //Turn right
{ type: move, dir: 1}, //Turn right
{ type: fire, dir: -1}, //Fire to the left
{ type: move, dir: 0}, //Move straight forward
```

Processed result from the server
========
```
{ type: move, dir: 0}, //Kör rakt fram
{ type: move, dir: 1}, //Turn right
{ type: move, dir: 1}, //Turn right
{ type: fire, dir: -1}, //Fire to the left
{type: collision, time: 0.6, chained: { type: move, dir: 0}}, //Collision with another ship at time 0.6 (after the begining of this event) while moving forwards.
``