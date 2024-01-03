shared class BasicAnimation : DefaultAnimation
{
    float getDuration()
    {
        return 1.0f * getTicksASecond();
    }

	Quaternion@ getRotation(float t)
	{
		return Quaternion().SetFromEulerDegrees(0, 360 * t, 0);
	}
}
