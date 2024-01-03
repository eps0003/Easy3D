shared class Reverse : IAnimation
{
	private IAnimation@ animation;

	Reverse(IAnimation@ animation)
	{
		@this.animation = animation;
	}

	float getDuration()
	{
		return animation.getDuration();
	}

	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation)
	{
		animation.Animate(1.0f - t, origin, translation, scale, rotation);
	}
}
