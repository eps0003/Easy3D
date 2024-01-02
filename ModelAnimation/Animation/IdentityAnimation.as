shared class IdentityAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	Vec3f@ getOrigin(float t)
	{
		return null;
	}

	Vec3f@ getTranslation(float t)
	{
		return null;
	}

	Vec3f@ getScale(float t)
	{
		return null;
	}

	Quaternion@ getRotation(float t)
	{
		return null;
	}
}
