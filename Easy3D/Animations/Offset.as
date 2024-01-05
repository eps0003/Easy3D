shared class Offset : IAnimation
{
	private IAnimation@ animation;
	private float offset = 0.0f;

	Offset(IAnimation@ animation, float offset)
	{
		@this.animation = animation;
		this.offset = offset;
	}

	float getDuration()
	{
		return animation.getDuration();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		float tNew = (t + offset) % 1.0f;
		animation.Animate(tNew, origin, translation, scale, rotation);
	}
}
