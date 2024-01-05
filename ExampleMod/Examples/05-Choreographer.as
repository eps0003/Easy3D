#include "Easy3D.as"
#include "BasicAnimation.as"

#define CLIENT_ONLY

Camera@ camera;
Model@ model;
Choreographer@ choreographer;

void onInit(CRules@ this)
{
	Render::addScript(Render::layer_prehud, getCurrentScriptName(), "Render", 0);

	@camera = Camera();

	// Initialize
	@model = Model("ActorHead.obj", "KnightSkin.png");

	// Arrange
	model.SetTranslation(Vec3f(0, 0, 2));
	model.SetRotation(Quaternion().SetFromEulerDegrees(0, 180, 0));

	// Animate
	Animator animator(model);

	@choreographer = Choreographer();
	choreographer.Register("forward", animator, BasicAnimation());
	choreographer.Register("reverse", animator, Rate(BasicAnimation(), -1));

	choreographer.Transition("forward");
}

void onTick(CRules@ this)
{
	if (getControls().isKeyPressed(KEY_SPACE))
	{
		choreographer.Transition("reverse");
	}
	else
	{
		choreographer.Transition("forward");
	}
}

void Render(int id)
{
	Render::SetAlphaBlend(false);
	Render::SetZBuffer(true, true);
	Render::SetBackfaceCull(false);
	Render::ClearZ();

	float t = Interpolation::getGameTime();

	camera.Render();
	choreographer.Animate(t);
	model.Render();
}
