#include "Easy3D.as"
#include "BasicAnimation.as"

#define CLIENT_ONLY

Camera@ camera;
Model@ model;
Animator@ animator;
IAnimation@ animation;

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
	@animator = Animator(model);
	@animation = BasicAnimation();
}

void Render(int id)
{
	Render::SetAlphaBlend(false);
	Render::SetZBuffer(true, true);
	Render::SetBackfaceCull(false);
	Render::ClearZ();

	float t = Interpolation::getGameTime();

	camera.Render();
	animator.Animate(animation, t);
	model.Render();
}
