shared class CompositeAnimation : IAnimation
{
	private IAnimation@[] animations;

	CompositeAnimation(IAnimation@[] animations)
	{
		this.animations = animations;
	}

	CompositeAnimation@ Add(IAnimation@ animation)
	{
		animations.push_back(animation);
		return this;
	}

	float getDuration()
	{
		return getTotalDuration();
	}

	Vec3f@ getOrigin(float t)
	{
		IAnimation@ animation = getLocalAnimation(t);
		return animation !is null
			? animation.getOrigin(getLocalTime(t))
			: Vec3f();
	}

	Vec3f@ getTranslation(float t)
	{
		IAnimation@ animation = getLocalAnimation(t);
		return animation !is null
			? animation.getTranslation(getLocalTime(t))
			: Vec3f();
	}

	Vec3f@ getScale(float t)
	{
		IAnimation@ animation = getLocalAnimation(t);
		return animation !is null
			? animation.getScale(getLocalTime(t))
			: Vec3f(1);
	}

	Quaternion@ getRotation(float t)
	{
		IAnimation@ animation = getLocalAnimation(t);
		return animation !is null
			? animation.getRotation(getLocalTime(t))
			: Quaternion();
	}

	private float getLocalTime(float t)
	{
		float totalDuration = getTotalDuration();

		for (uint i = 0; i < animations.size(); i++)
		{
			IAnimation@ animation = animations[i];
			float duration = animation.getDuration();
			float percentageDuration = duration / totalDuration;

			if (t < percentageDuration)
			{
				return t / percentageDuration;
			}

			t -= percentageDuration;
		}

		return 1.0f;
	}

	private IAnimation@ getLocalAnimation(float t)
	{
		if (animations.empty())
		{
			return null;
		}

		float totalDuration = getTotalDuration();
		if (totalDuration <= 0 || t >= 1)
		{
			return animations[animations.size() - 1];
		}

		for (uint i = 0; i < animations.size(); i++)
		{
			IAnimation@ animation = animations[i];
			float duration = animation.getDuration();
			float percentageDuration = duration / totalDuration;

			if (t < percentageDuration)
			{
				return animation;
			}

			t -= percentageDuration;
		}

		return null;
	}

	private float getTotalDuration()
	{
		float totalDuration = 0.0f;

		for (uint i = 0; i < animations.size(); i++)
		{
			totalDuration += animations[i].getDuration();
		}

		return totalDuration;
	}
}
