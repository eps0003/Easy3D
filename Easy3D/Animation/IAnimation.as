shared interface IAnimation
{
	float getDuration();
	void Animate(float t, Vec3f& origin, Vec3f& translation, Vec3f& scale, Quaternion& rotation);
}
