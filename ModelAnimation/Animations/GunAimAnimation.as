shared class UpperRightArmGunAimAnimation : DefaultAnimation
{
	Vec3f@ getOrigin(float t)
	{
		return Vec3f(0.125f, 0, 0.125f);
	}

	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(80, 40, -60);
	}
}

shared class LowerRightArmGunAimAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(70, 0, 0);
	}
}

shared class UpperLeftArmGunAimAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(80, -25, 5);
	}
}

shared class LowerLeftArmGunAimAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(5, 0, 0);
	}
}
