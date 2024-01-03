shared class BasicAnimation : IAnimation
{
	float getDuration()
	{
		return 1.0f * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		rotation = Quaternion().SetFromEulerDegrees(0, 360 * t, 0);
	}
}
