shared class Animator
{
	private Model@ model;

	private dictionary animations;
	private string animationName;

	private Vec3f prevOrigin;
	private Vec3f prevTranslation;
	private Vec3f prevScale;
	private Quaternion prevRotation;

	private float transitionStartTime = 0.0f;
	private float defaultTransitionDuration = 0.3f * getTicksASecond();
	private float transitionDuration = 0.0f;

	Animator(Model@ model)
	{
		@this.model = model;
		SetPreviousValues();
	}

	Animator(Model@ model, float defaultTransitionDuration)
	{
		@this.model = model;
		this.defaultTransitionDuration = defaultTransitionDuration;
		SetPreviousValues();
	}

	void RegisterAnimation(string name, IAnimation@ animation)
	{
		if (name == "" || animation is null) return;

		animations.set(name, @animation);
	}

	void SetAnimation(string name)
	{
		SetAnimation(name, defaultTransitionDuration);
	}

	void SetAnimation(string name, float transitionDuration)
	{
		if (animationName == name) return;

		animationName = name;
		this.transitionDuration = transitionDuration;
		transitionStartTime = getGameTime();
		SetPreviousValues();
	}

	void Animate()
	{
		IAnimation@ animation;
		if (!animations.get(animationName, @animation)) return;

		float t = getGameTime();

		if (transitionStartTime > 0.0f && t - transitionStartTime < transitionDuration)
		{
			float tLerp = Easing::inOutQuad((t - transitionStartTime) / transitionDuration);

			model.SetOrigin(prevOrigin.lerp(animation.getOrigin(t), tLerp));
			model.SetTranslation(prevTranslation.lerp(animation.getTranslation(t), tLerp));
			model.SetScale(prevScale.lerp(animation.getScale(t), tLerp));
			model.SetRotation(prevRotation.lerp(animation.getRotation(t), tLerp));
		}
		else
		{
			model.SetOrigin(animation.getOrigin(t));
			model.SetTranslation(animation.getTranslation(t));
			model.SetScale(animation.getScale(t));
			model.SetRotation(animation.getRotation(t));
		}
	}

	private void SetPreviousValues()
	{
		prevOrigin = model.getOrigin();
		prevTranslation = model.getTranslation();
		prevScale = model.getScale();
		prevRotation = model.getRotation();
	}
}
