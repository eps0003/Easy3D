shared class Wait : IdentityAnimation
{
	private float seconds = 0.0f;

	Wait(float seconds)
	{
		this.seconds = Maths::Max(0, seconds);
	}

	float getDuration()
	{
		return seconds * getTicksASecond();
	}
}
