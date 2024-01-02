shared class DefaultAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	Vec3f@ getOrigin(float t)
	{
		return Vec3f();
	}

	Vec3f@ getTranslation(float t)
	{
		return Vec3f();
	}

	Vec3f@ getScale(float t)
	{
		return Vec3f(1);
	}

	Quaternion@ getRotation(float t)
	{
		return Quaternion();
	}
}
