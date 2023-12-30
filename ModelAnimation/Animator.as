shared class Animator
{
	private Model@ model;
	private IAnimation@ animation;

	private Vec3f prevOrigin;
	private Vec3f prevTranslation;
	private Vec3f prevScale;
	private Quaternion prevRotation;

	private float transitionStartTime = 0.0f;
	private float transitionDuration = 0.5f * getTicksASecond();

	Animator(Model@ model)
	{
		@this.model = model;
		SetPreviousValues();
	}

	void SetAnimation(IAnimation@ animation)
	{
		if (this.animation is animation) return;

		@this.animation = animation;

		SetPreviousValues();
		transitionStartTime = getGameTime();
	}

	void Animate()
	{
		if (animation is null) return;

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
