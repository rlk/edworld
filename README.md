# Edworld

Edworld is a sandbox interactive built on the [Thumb](https://github.com/rlk/thumb) engine. Edworld exposes Thumb's in-engine scene editor, real-time renderer, and [ODE](http://ode.org)-based rigid body dynamics simulation.

Edworld also takes full advantage of Thumb's stereoscopic rendering modes and 6DOF controller inputs, enabling the creation of virtual reality toys using the Oculus Rift, Sixense motion trackers, and related technologies.

* * *

Note: Edworld *does not* support Thumb's distributed rendering architecture because it does not attempt to ensure deterministic evaluation of the ODE physical system. It works, but the physics might not remain in sync across the cluster.