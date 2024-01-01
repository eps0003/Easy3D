shared class Animator
{
	private Model@ model;

	private dictionary animations;
	private IAnimation@ animation;

	private Vec3f initialOrigin;
	private Vec3f initialTranslation;
	private Vec3f initialScale;
	private Quaternion initialRotation;

	private float transitionStartTime = 0.0f;
	private float defaultTransitionDuration = 0.5f * getTicksASecond();
	private float transitionDuration = 0.0f;

	Animator(Model@ model)
	{
		@this.model = model;

		initialOrigin = model.getOrigin();
		initialTranslation = model.getTranslation();
		initialScale = model.getScale();
		initialRotation = model.getRotation();
	}

	Animator(Model@ model, float defaultTransitionDuration)
	{
		@this.model = model;
		this.defaultTransitionDuration = defaultTransitionDuration;

		initialOrigin = model.getOrigin();
		initialTranslation = model.getTranslation();
		initialScale = model.getScale();
		initialRotation = model.getRotation();
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

		uint t = getGameTime();
		float tAnim = t * 0.3f;

		Vec3f currentOrigin = model.getOrigin();
		Vec3f currentTranslation = model.getTranslation();
		Vec3f currentScale = model.getScale();
		Quaternion currentRotation = model.getRotation();

		Vec3f@ animOrigin = animation.getOrigin(tAnim);
		Vec3f@ animTranslation = animation.getTranslation(tAnim);
		Vec3f@ animScale = animation.getScale(tAnim);
		Quaternion@ animRotation = animation.getRotation(tAnim);

		Vec3f desiredOrigin = animOrigin is null ? currentOrigin : (initialOrigin + animOrigin);
		Vec3f desiredTranslation = animTranslation is null ? currentTranslation : (initialTranslation + animTranslation);
		Vec3f desiredScale = animScale is null ? currentScale : (initialScale * animScale);
		Quaternion desiredRotation = animRotation is null ? currentRotation : (initialRotation * animRotation);

		if (transitionStartTime > 0.0f && transitionDuration > 0.0f && t - transitionStartTime < transitionDuration)
		{
			float tLerp = Maths::Pow((t - transitionStartTime) / transitionDuration, 1.5f);

			model.SetOrigin(currentOrigin.lerp(desiredOrigin, tLerp));
			model.SetTranslation(currentTranslation.lerp(desiredTranslation, tLerp));
			model.SetScale(currentScale.lerp(desiredScale, tLerp));
			model.SetRotation(currentRotation.lerp(desiredRotation, tLerp));
		}
		else
		{
			model.SetOrigin(desiredOrigin);
			model.SetTranslation(desiredTranslation);
			model.SetScale(desiredScale);
			model.SetRotation(desiredRotation);
		}
	}
}
