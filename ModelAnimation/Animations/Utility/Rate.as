shared class Rate : IAnimation
{
	private IAnimation@ animation;
	private float rate = 1.0f;

	Rate(IAnimation@ animation, float rate)
	{
		@this.animation = animation;
		this.rate = rate;
	}

	float getDuration()
	{
		return rate != 0.0f
			? Maths::Abs(animation.getDuration() / rate)
			: 0.0f;
	}

	private float getTime(float t)
	{
		return rate >= 0.0f ? t : 1.0f - t;
	}

	Vec3f@ getOrigin(float t)
	{
		return animation.getOrigin(getTime(t));
	}

	Vec3f@ getTranslation(float t)
	{
		return animation.getTranslation(getTime(t));
	}

	Vec3f@ getScale(float t)
	{
		return animation.getScale(getTime(t));
	}

	Quaternion@ getRotation(float t)
	{
		return animation.getRotation(getTime(t));
	}
}
