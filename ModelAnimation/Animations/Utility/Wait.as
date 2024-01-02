shared class Wait : IdentityAnimation
{
	private float duration = 0.0f;

	Wait(float duration)
	{
		this.duration = Maths::Max(0, duration);
	}

	float getDuration()
	{
		return duration;
	}
}
