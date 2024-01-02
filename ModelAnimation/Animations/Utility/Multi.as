shared class Multi : IAnimation
{
	private IAnimation@[] animations;

	Multi(IAnimation@[] animations)
	{
		this.animations = animations;
	}

	Multi@ Add(IAnimation@ animation)
	{
		animations.push_back(animation);
		return this;
	}

	float getDuration()
	{
		// Play all animations based on the duration of the first animation
		return animations.size() > 0 ? animations[0].getDuration() : 0.0f;
	}

	Vec3f@ getOrigin(float t)
	{
		Vec3f@ combinedOrigin;

		for (uint i = 0; i < animations.size(); i++)
		{
			Vec3f@ origin = animations[i].getOrigin(t);
			if (origin !is null)
			{
				if (combinedOrigin is null)
				{
					@combinedOrigin = origin;
				}
				else
				{
					combinedOrigin += origin;
				}
			}
		}

		return combinedOrigin;
	}

	Vec3f@ getTranslation(float t)
	{
		Vec3f@ combinedTranslation;

		for (uint i = 0; i < animations.size(); i++)
		{
			Vec3f@ translation = animations[i].getTranslation(t);
			if (translation !is null)
			{
				if (combinedTranslation is null)
				{
					@combinedTranslation = translation;
				}
				else
				{
					combinedTranslation += translation;
				}
			}
		}

		return combinedTranslation;
	}

	Vec3f@ getScale(float t)
	{
		Vec3f@ combinedScale;

		for (uint i = 0; i < animations.size(); i++)
		{
			Vec3f@ scale = animations[i].getScale(t);
			if (scale !is null)
			{
				if (combinedScale is null)
				{
					@combinedScale = scale;
				}
				else
				{
					combinedScale *= scale;
				}
			}
		}

		return combinedScale;
	}

	Quaternion@ getRotation(float t)
	{
		Quaternion@ combinedRotation;

		for (uint i = 0; i < animations.size(); i++)
		{
			Quaternion@ rotation = animations[i].getRotation(t);
			if (rotation !is null)
			{
				if (combinedRotation is null)
				{
					@combinedRotation = rotation;
				}
				else
				{
					combinedRotation.SetFromEulerRadians(combinedRotation.toEulerRadians() + rotation.toEulerRadians());
				}
			}
		}

		return combinedRotation;
	}
}
