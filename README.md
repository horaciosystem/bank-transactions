Bank Balance
========

An Elixir project to make bank transactions using the actor model.

To run the "main" stript use:
```
mix run boot.exs
```
---

### Concurrency model  Actor Model

***1.  Each actor is a Process***
***2.  Each actor performs a specific task***
***3. To tell a Process to do something you nedd send in a message. The process can also send back another  message.***
***4. The kinds of messages the process can act upon is specific to the process itself***
***5. Processes do not share any information with other processes***
***6. Processes in Elixir are extremely lightweight in terms of memory and CPU (unlike threads in many other programming language***
