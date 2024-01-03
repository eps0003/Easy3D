shared class UpperRightArmGunHoldAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		rotation = Quaternion().SetFromEulerDegrees(20, 45, 0);
	}
}

shared class LowerRightArmGunHoldAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		rotation = Quaternion().SetFromEulerDegrees(35, 0, 0);
	}
}

shared class UpperLeftArmGunHoldAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		rotation = Quaternion().SetFromEulerDegrees(15, -10, 0);
	}
}

shared class LowerLeftArmGunHoldAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		rotation = Quaternion().SetFromEulerDegrees(20, 0, 0);
	}
}
