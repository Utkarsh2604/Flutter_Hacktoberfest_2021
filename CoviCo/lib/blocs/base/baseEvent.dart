/// Base event class used in 'bloc`s for dispatching event.
///
/// Blocs will expose a stream for dispatching events and those events
/// will extend [BaseEvent].
///
/// Further, a bloc will take action according to the [BaseEvent] dispatched.
abstract class BaseEvent {}
