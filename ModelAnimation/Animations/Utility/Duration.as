shared class Duration : IAnimation
{
	private IAnimation@ animation;
	private float duration = 0.0f;

	Duration(IAnimation@ animation, float duration)
	{
		@this.animation = animation;
		this.duration = duration;
	}

	float getDuration()
	{
		return duration;
	}

	Vec3f@ getOrigin(float t)
	{
		return animation.getOrigin(t);
	}

	Vec3f@ getTranslation(float t)
	{
		return animation.getTranslation(t);
	}

	Vec3f@ getScale(float t)
	{
		return animation.getScale(t);
	}

	Quaternion@ getRotation(float t)
	{
		return animation.getRotation(t);
	}
}
