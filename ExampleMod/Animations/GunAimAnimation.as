shared class UpperRightArmGunAimAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		origin = Vec3f(0.125f, 0, 0.125f);
		rotation = Quaternion().SetFromEulerDegrees(80, 40, -60);
	}
}

shared class LowerRightArmGunAimAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		rotation = Quaternion().SetFromEulerDegrees(70, 0, 0);
	}
}

shared class UpperLeftArmGunAimAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		rotation = Quaternion().SetFromEulerDegrees(80, -25, 5);
	}
}

shared class LowerLeftArmGunAimAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		rotation = Quaternion().SetFromEulerDegrees(5, 0, 0);
	}
}
