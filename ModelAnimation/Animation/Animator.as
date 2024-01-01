shared class Animator
{
	private Model@ model;

	private dictionary animations;
	private IAnimation@ animation;

	private float transitionStartTime = 0.0f;
	private float defaultTransitionDuration = 0.5f * getTicksASecond();
	private float transitionDuration = 0.0f;

	Animator(Model@ model)
	{
		@this.model = model;
	}

	Animator(Model@ model, float defaultTransitionDuration)
	{
		@this.model = model;
		this.defaultTransitionDuration = defaultTransitionDuration;
	}

	Animator@ Register(string name, IAnimation@ animation)
	{
		if (name != "" && animation !is null)
		{
			animations.set(name, @animation);
		}

		return this;
	}

	void Transition(string name)
	{
		Transition(name, defaultTransitionDuration);
	}

	void Transition(string name, float transitionDuration)
	{
		IAnimation@ newAnimation;
		animations.get(name, @newAnimation);

		// Always override transition duration even when transitioning to the same animation
		// This is in case the transition duration is changed while transitioning
		this.transitionDuration = transitionDuration;

		if (animation !is newAnimation)
		{
			@animation = newAnimation;
			transitionStartTime = getGameTime();
		}
	}

	void Animate()
	{
		if (animation is null) return;

		float t = getGameTime();

		if (transitionStartTime > 0.0f && transitionDuration > 0.0f && t - transitionStartTime < transitionDuration)
		{
			float tLerp = Maths::Pow((t - transitionStartTime) / transitionDuration, 2.0f);

			model.SetOrigin(model.getOrigin().lerp(animation.getOrigin(t), tLerp));
			model.SetTranslation(model.getTranslation().lerp(animation.getTranslation(t), tLerp));
			model.SetScale(model.getScale().lerp(animation.getScale(t), tLerp));
			model.SetRotation(model.getRotation().lerp(animation.getRotation(t), tLerp));
		}
		else
		{
			model.SetOrigin(animation.getOrigin(t));
			model.SetTranslation(animation.getTranslation(t));
			model.SetScale(animation.getScale(t));
			model.SetRotation(animation.getRotation(t));
		}
	}
}
