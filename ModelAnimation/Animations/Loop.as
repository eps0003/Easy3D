shared class Loop : IAnimation
{
	private IAnimation@ animation;
	private uint count = 0;

	Loop(IAnimation@ animation, uint count)
	{
		@this.animation = animation;
		this.count = count;
	}

	float getDuration()
	{
		return animation.getDuration() * (count + 1);
	}

	private float getTime(float t)
	{
		return (t * (count + 1)) % 1.0f;
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
