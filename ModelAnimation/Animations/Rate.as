shared class Rate : IAnimation
{
	private IAnimation@ animation;
	private float rate = 1.0f;

	Rate(IAnimation@ animation, float rate)
	{
		@this.animation = animation;
		this.rate = rate;
	}

	float getDuration()
	{
		return rate != 0.0f
			? Maths::Abs(animation.getDuration() / rate)
			: 0.0f;
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float tNew = rate >= 0.0f ? t : 1.0f - t;
		animation.Animate(tNew, origin, translation, scale, rotation);
	}
}
