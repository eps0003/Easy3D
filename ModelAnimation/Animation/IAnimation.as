shared interface IAnimation
{
	float getDuration();
	Vec3f@ getOrigin(float t);
	Vec3f@ getTranslation(float t);
	Vec3f@ getScale(float t);
	Quaternion@ getRotation(float t);
}
