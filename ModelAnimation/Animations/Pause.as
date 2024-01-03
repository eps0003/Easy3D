shared class Pause : IAnimation
{
	private IAnimation@ animation;
	private float t = 0.0f;
	private float seconds = 0.0f;

	Pause(IAnimation@ animation, float t, float seconds)
	{
		@this.animation = animation;
		this.t = t;
		this.seconds = seconds;
	}

	float getDuration()
	{
		return seconds * getTicksASecond();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		animation.Animate(this.t, origin, translation, scale, rotation);
	}
}
