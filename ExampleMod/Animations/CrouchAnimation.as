shared class BodyCrouchAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		translation = Vec3f(0, -0.375, 0);
	}
}

shared class UpperLeftLegCrouchAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		rotation = Quaternion().SetFromEulerDegrees(-10, 0, 0);
	}
}

shared class LowerLeftLegCrouchAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		rotation = Quaternion().SetFromEulerDegrees(-80, 0, 0);
	}
}

shared class UpperRightLegCrouchAnimation : IAnimation
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

shared class LowerRightLegCrouchAnimation : IAnimation
{
	float getDuration()
	{
		return 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		rotation = Quaternion().SetFromEulerDegrees(-70, 0, 0);
	}
}
