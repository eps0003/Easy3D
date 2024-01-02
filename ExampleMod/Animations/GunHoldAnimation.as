shared class UpperRightArmGunHoldAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(20, 45, 0);
	}
}

shared class LowerRightArmGunHoldAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(35, 0, 0);
	}
}

shared class UpperLeftArmGunHoldAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(15, -10, 0);
	}
}

shared class LowerLeftArmGunHoldAnimation : DefaultAnimation
{
	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(20, 0, 0);
	}
}
