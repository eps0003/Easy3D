# Easy3D

A [King Arthur's Gold](https://kag2d.com/) mod that provides the tools to more easily create 3D mods. Easy3D currently focuses on models and animations but also contains various utility classes and functions.

## Table of Contents

- [Usage](#usage)
- [Examples](#examples)
  - [Running examples](#running-examples)
  - [Rendering a basic model](#rendering-a-basic-model)
  - [Composing a complex model](#composing-a-complex-model)
  - [Animating a basic model](#animating-a-basic-model)
  - [Composing a complex animation](#composing-a-complex-animation)
  - [Choreographing animations](#choreographing-animations)
- [Classes](#classes)
  - [Animator](#animator)
  - [Choreographer](#choreographer)
  - [CMatrix](#cmatrix)
  - [CompositeModel](#compositemodel)
  - [Model](#model)
  - [Quaternion](#quaternion)
  - [Vec3f](#vec3f)
- [Interfaces](#interfaces)
  - [IAnimation](#ianimation)
- [Functions](#functions)
  - [getAspectRatio()](#getaspectratio)
  - [getFPS()](#getfps)
  - [getInterpolatedGameTime()](#getinterpolatedgametime)
  - [isTickPaused()](#istickpaused)
  - [isLocalHost()](#islocalhost)
- [Easing](#easing)
  - [easeIn(float t, float power)](#easeinfloat-t-float-power)
  - [easeOut(float t, float power)](#easeoutfloat-t-float-power)
  - [easeInOut(float t, float power)](#easeinoutfloat-t-float-power)
  - [IEasing](#ieasing)
  - [EaseIn](#easein)
  - [EaseOutIn](#easeout)
  - [EaseInOut](#easeinout)
- [Maths](#maths)
  - [Maths::Sign(float value)](#mathssignfloat-value)
  - [Maths::ClampSmart(float value, float bound1, float bound2)](#mathsclampsmartfloat-value-float-bound1-float-bound2)
  - [Maths::AngleDifference(float angle1, float angle2)](#mathsangledifferencefloat-a1-float-a2)
  - [Maths::LerpAngle(float angle1, float angle2, float t)](#mathslerpanglefloat-a1-float-a2-float-t)
  - [Maths::toDegrees(float radians)](#mathstodegreesfloat-radians)
  - [Maths::toRadians(float degrees)](#mathstoradiansfloat-degrees)
- [Utility Animations](#utility-animations)
  - [CompositeAnimation](#compositeanimation)
  - [Duration](#duration)
  - [Lerp](#lerp)
  - [Multi](#multi)
  - [Offset](#offset)
  - [Pause](#pause)
  - [Rate](#rate)
  - [Repeat](#repeat)
  - [Reverse](#reverse)
  - [Trim](#trim)
- [Frequently Asked Questions](#frequently-asked-questions)
  - [Why use `shared`?](#why-use-shared)

## Usage

1. Put the Easy3D folder in your `Mods`` folder.
2. Add `Easy3D` to a new line in `mods.cfg` above any mod that will use it.
3. Add the following scripts to your gamemode config:

   - `InterpolationHooks.as`

   > **Tip:** Refer to [`ExampleMod/Default/Rules.cfg`](/ExampleMod/Default/Rules.cfg) as an example.

4. Add `#include "Easy3D.as"` to the top of any scripts that require it.

## Examples

### Running examples

Update [`ExampleMod/Default/Rules.cfg`](/ExampleMod/Default/Rules.cfg) to enable/disable each example script. Only one example script should be active at once.

### Rendering a basic model

**Script:** [ExampleMod/Examples/01-Model.as](/ExampleMod/Examples/01-Model.as)

Demonstrates rendering a basic model.

### Composing a complex model

**Script:** [ExampleMod/Examples/02-CompositeModel.as](/ExampleMod/Examples/02-CompositeModel.as)

Demonstrates composing a complex model.

### Animating a basic model

**Script:** [ExampleMod/Examples/03-Animation.as](/ExampleMod/Examples/03-Animation.as)

Demonstrates animating a basic model.

### Composing a complex animation

**Script:** [ExampleMod/Examples/04-CompositeAnimation.as](/ExampleMod/Examples/04-CompositeAnimation.as)

Demonstrates creating a composite animation and using [utility animations](#utility-animations) to reduce the complexity of individual animations.

### Choreographing animations

**Script:** [ExampleMod/Examples/05-Choreographer.as](/ExampleMod/Examples/05-Choreographer.as)

Demonstrates animating a basic model using a choreographer.

## Classes

### Animator

Animates a specific model using a provided animation.

<sup>[Source](/Easy3D/Animation/Animator.as) · [↑](#table-of-contents)</sup>

### Camera

A camera that can be positioned and rotated which represents the client's view.

<sup>[Source](/Easy3D/Camera.as) · [↑](#table-of-contents)</sup>

### Choreographer

Organizes one or more animations into states to choreograph complex animations.

<sup>[Source](/Easy3D/Animation/Choreographer.as) · [↑](#table-of-contents)</sup>

### CMatrix

A wrapper class for `float[]` matrices that provides methods for the vanilla `Matrix::` functions and [operator overloads](https://www.angelcode.com/angelscript/sdk/docs/manual/doc_script_class_ops.html) (`=`, `*`, `*=`) for intuitive matrix multiplication.

<sup>[Source](/Easy3D/Utility/CMatrix.as) · [↑](#table-of-contents)</sup>

### CompositeModel

A model that is composed of several models in a tree-like structure, with child models translated, rotated, and scaled relative to their parent model.

<sup>[Source](/Easy3D/Model/CompositeModel.as) · [↑](#table-of-contents)</sup>

### Model

A 3D model that has an .obj model, a texture, and can be translated, rotated, and scaled.

<sup>[Source](/Easy3D/Model/Model.as) · [↑](#table-of-contents)</sup>

### Quaternion

A representation of spatial orientations and rotations in three-dimensional space.

> **Tip:** Quaternions do not suffer from [gimbal lock](https://en.wikipedia.org/wiki/Gimbal_lock) as [Euler angles](https://en.wikipedia.org/wiki/Euler_angles) do which allows for straightforward interpolation between any two angles.

> **Read more:** [Quaternions and spatial rotation](https://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation)

<sup>[Source](/Easy3D/Utility/Quaternion.as) · [↑](#table-of-contents)</sup>

### Vec3f

Vec2f but with three dimensions.

<sup>[Source](/Easy3D/Utility/Vec3f.as) · [↑](#table-of-contents)</sup>

## Interfaces

### IAnimation

Represents an animation for a model. Properties of a model can be animated based on a `t` value that ranges from 0 and 1 which represents the animation progress.

> **Tip:** The `Animate` method of animations should ideally be [pure](https://en.wikipedia.org/wiki/Pure_function), as in it should ideally produce the same animation state when provided with the same value of `t`. This will allow the animation to play predictably, especially when augmented using [utility animations](#utility-animations). However, there may be some cases where an animation may not be pure, such as when the model should face the direction of the camera.

<sup>[Source](/Easy3D/Animation/IAnimation.as) · [↑](#table-of-contents)</sup>

## Functions

### getInterpolatedGameTime()

Returns the interpolated game time of the client. Returns the non-interpolated game time if called on the server

<sup>[Source](/Easy3D/Utility/Utility.as) · [↑](#table-of-contents)</sup>

### getAspectRatio()

Returns the aspect ratio of the window.

<sup>[Source](/Easy3D/Utility/Utility.as) · [↑](#table-of-contents)</sup>

### getFPS()

Returns the frames per second of the client.

> **Note:** When the window is not in focus, this function assumes 30 FPS if the framerate is capped (`v_capped = true`) and 60 FPS if not.

<sup>[Source](/Easy3D/Utility/Utility.as) · [↑](#table-of-contents)</sup>

### isLocalHost()

Returns whether the client is also the server and vice versa.

<sup>[Source](/Easy3D/Utility/Utility.as) · [↑](#table-of-contents)</sup>

### isTickPaused()

Returns whether the `onTick()` hook is paused when on localhost and the pause menu is visible.

<sup>[Source](/Easy3D/Utility/Utility.as) · [↑](#table-of-contents)</sup>

## Easing

Easing functions alter the rate of change of `t` which ranges from 0 to 1. The optional `power` parameter accepts any positive decimal value and specifies the intensity of the polynomial ease:

- `1.0f` is linear
- `2.0f` is quadratic
- `3.0f` is quartic
- `4.0f` is quintic

Sinusoidal, exponential, and circular easing functions have not been implemented due to their increased performance impact from the use of sine, cosine, and square root operations. Polynomial easing functions accomplish a near identical effect without the performance hit.

> **Learn more:** https://easings.net/

---

### easeIn(float t, float power)

Start slow and end fast.

<sup>[Source](/Easy3D/Utility/Easing.as) · [↑](#table-of-contents)</sup>

### easeOut(float t, float power)

Start fast and end slow.

<sup>[Source](/Easy3D/Utility/Easing.as) · [↑](#table-of-contents)</sup>

### easeInOut(float t, float power)

Start and end slow, increasing in speed at the middle.

<sup>[Source](/Easy3D/Utility/Easing.as) · [↑](#table-of-contents)</sup>

---

### IEasing

An interface that represents an easing. All ease classes implement this interface.

<sup>[Source](/Easy3D/Utility/Easing.as) · [↑](#table-of-contents)</sup>

### EaseLinear

Class version of no easing.

<sup>[Source](/Easy3D/Utility/Easing.as) · [↑](#table-of-contents)</sup>

### EaseIn

Class version of [`easeIn(float t, float power)`](#easeinfloat-t-float-power).

<sup>[Source](/Easy3D/Utility/Easing.as) · [↑](#table-of-contents)</sup>

### EaseOut

Class version of [`easeOut(float t, float power)`](#easeoutfloat-t-float-power).

<sup>[Source](/Easy3D/Utility/Easing.as) · [↑](#table-of-contents)</sup>

### EaseInOut

Class version of [`easeInOut(float t, float power)`](#easeinoutfloat-t-float-power).

<sup>[Source](/Easy3D/Utility/Easing.as) · [↑](#table-of-contents)</sup>

## Maths

### Maths::AngleDifference(float angle1, float angle2)

Returns the shortest angle difference between `angle1` and `angle2`.

<sup>[Source](/Easy3D/Utility/Maths.as) · [↑](#table-of-contents)</sup>

### Maths::ClampSmart(float value, float bound1, float bound2)

Clamps `value` between `bound1` and `bound2`.

<sup>[Source](/Easy3D/Utility/Maths.as) · [↑](#table-of-contents)</sup>

### Maths::LerpAngle(float angle1, float angle2, float t)

Interpolates between `angle1` and `angle2`, travelling the shortest angle distance.

<sup>[Source](/Easy3D/Utility/Maths.as) · [↑](#table-of-contents)</sup>

### Maths::Sign(float value)

Returns the sign of `value` (`-1` if negative, `1` is positive, `0` if zero).

<sup>[Source](/Easy3D/Utility/Maths.as) · [↑](#table-of-contents)</sup>

### Maths::toDegrees(float radians)

Converts `radians` to degrees.

<sup>[Source](/Easy3D/Utility/Maths.as) · [↑](#table-of-contents)</sup>

### Maths::toRadians(float degrees)

Converts `degrees` to radians.

<sup>[Source](/Easy3D/Utility/Maths.as) · [↑](#table-of-contents)</sup>

## Utility Animations

Utility animations augment animations to help reduce the number of animations required to implement.

> **Tip:** Utility animations implement the [`IAnimation`](#ianimation) interface just like any animation you will implement, so utility functions can be chained/nested to augment animations as required.

### CompositeAnimation

Plays several animations in sequence, increasing the duration accordingly.

```angelscript
// Play `animation1`, `animation2`, and `animation3` in sequence
CompositeAnimation().Add(animation1).Add(animation2).Add(animation3);

// Can also be initialized like so
IAnimation@[] animations = { animation1, animation2, animation3 };
CompositeAnimation(animations);
```

<sup>[Source](/Easy3D/Animations/CompositeAnimation.as) · [↑](#table-of-contents)</sup>

### Duration

Overrides the duration of an animation.

```angelscript
// Override the duration of `animation` to two seconds
Duration(animation, 2.0f);
```

<sup>[Source](/Easy3D/Animations/Duration.as) · [↑](#table-of-contents)</sup>

### Lerp

Interpolates between the end of an animation and the current time of another animation for a specified percentage of the animation.

```angelscript
// Interpolate between the end of `prevAnimation` and the current time of `animation` for a quarter of `animation`
Lerp(prevAnimation, animation, 0.25f);
```

<sup>[Source](/Easy3D/Animations/Lerp.as) · [↑](#table-of-contents)</sup>

### Multi

Layers multiple animations, playing all animations for the duration of the first animation.

```angelscript
// Play `animation1`, `animation2`, and `animation3` at the same time for the duration of `animation1`
Multi().Add(animation1).Add(animation2).Add(animation3);

// Can also be initialized like so
IAnimation@[] animations = { animation1, animation2, animation3 };
Multi(animations);
```

<sup>[Source](/Easy3D/Animations/Multi.as) · [↑](#table-of-contents)</sup>

### Offset

Starts the animation at the specified offset.

```angelscript
// Start `animation` half way through
Offset(animation, 0.5f);
```

<sup>[Source](/Easy3D/Animations/Offset.as) · [↑](#table-of-contents)</sup>

### Pause

Pauses an animation at a desired `t` for a specified duration.

```angelscript
// Pause `animation` at the half way point for two seconds
Pause(animation, 0.5f, 2.0f);
```

<sup>[Source](/Easy3D/Animations/Pause.as) · [↑](#table-of-contents)</sup>

### Rate

Scales the duration of an animation by a specified rate, even allowing animations to be reversed.

```angelscript
// Play `animation`` at half speed
Rate(animation, 0.5f);

// Play `animation` at double speed
Rate(animation, 2.0f);

// Play `animation` in reverse
Rate(animation, -1.0f);
```

<sup>[Source](/Easy3D/Animations/Rate.as) · [↑](#table-of-contents)</sup>

### Repeat

Plays an animation a specified number of times.

```angelscript
// Play `animation` twice
Repeat(animation, 2);
```

<sup>[Source](/Easy3D/Animations/Repeat.as) · [↑](#table-of-contents)</sup>

### Reverse

Reverses an animation.

```angelscript
// Play `animation` in reverse
Reverse(animation);
```

<sup>[Source](/Easy3D/Animations/Reverse.as) · [↑](#table-of-contents)</sup>

### Trim

Trims the start and/or end of the animation, adjusting the duration accordingly. Can also be used to reverse, repeat and/or offset the animation.

```angelscript
// Play only the first half of `animation`
Trim(animation, 0.0f, 0.5f);

// Start `animation` half way through
Trim(animation, 0.5f, 1.5f);

// Play `animation` two and a half times
Trim(animation, 0.0f, 2.5f);

// Play `animation` in reverse
Trim(animation, 1.0f, 0.0f);

// The previous three examples combined
Trim(animation, 3.0f, 0.5f);
```

<sup>[Source](/Easy3D/Animations/Trim.as) · [↑](#table-of-contents)</sup>

## Frequently Asked Questions

### Why use `shared`?

The [`shared`](https://www.angelcode.com/angelscript/sdk/docs/manual/doc_script_shared.html) keyword is used to avoid an issue when attempting to use [`cast<>()`](https://www.angelcode.com/angelscript/sdk/docs/manual/doc_expressions.html#conversion) to convert the type of class handles. This issue is inevitably encountered when developing [total conversion](https://en.wikipedia.org/wiki/Video_game_modding#Total_conversion) mods that have systems that handle various classes that inherit/implement a shared parent class/interface.

Put simply, [AngelScript](https://www.angelcode.com/angelscript/) (in the context of KAG) sometimes 'forgets' what class/interfaces some classes inherit/implement. As a result, attempting to cast class handles to another valid class handle in some scenarios returns `null` even though the cast should have worked.

Using the `shared` keyword for classes and interfaces prevents this issue from occurring, but it unfortunately comes with some limitations:

- `shared` classes can only call `shared` functions and inherit/implement `shared` classes/interfaces. This prevents us from using the majority of classes, interfaces, and functions from the base game.
- [Function handles](https://www.angelcode.com/angelscript/sdk/docs/manual/doc_datatypes_funcptr.html) (`funcdef`) cannot be used with `shared` functions or methods in `shared` classes.

  > **Tip:** A better alternative is to use an interface instead of a function declaration. Classes that implement the interface can be instantiated with any dependencies, whereas a function definition only has access to the parameters defined in the function definition.
