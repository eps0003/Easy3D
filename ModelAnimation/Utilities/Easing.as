namespace Easing
{
    shared float inOutQuad(float x)
    {
        return x < 0.5f
            ? 2.0f * x * x
            : 1 - Maths::Pow(-2.0f * x + 2.0f, 2.0f) / 2.0f;
    }
}
