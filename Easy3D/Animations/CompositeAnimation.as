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
		float totalDuration = 0.0f;

		for (uint i = 0; i < animations.size(); i++)
		{
			totalDuration += animations[i].getDuration();
		}

		return totalDuration;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		IAnimation@ animation = getLocalAnimation(t);
		if (animation is null) return;

		animation.Animate(getLocalTime(t), origin, translation, scale, rotation);
	}

	private float getLocalTime(float t)
	{
		float totalDuration = getDuration();

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

		float totalDuration = getDuration();
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
}
