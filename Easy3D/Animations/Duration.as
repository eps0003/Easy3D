shared class Duration : IAnimation
{
	private IAnimation@ animation;
	private float duration = 0.0f;

	Duration(IAnimation@ animation, float duration)
	{
		@this.animation = animation;
		this.duration = duration;
	}

	float getDuration()
	{
		return duration;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		animation.Animate(t, origin, translation, scale, rotation);
	}
}
