#include "ModelAnimation.as"

#define CLIENT_ONLY

Camera@ camera;
Model@ model;

void onInit(CRules@ this)
{
	Render::addScript(Render::layer_prehud, getCurrentScriptName(), "Render", 0);

	@camera = Camera();

	// Initialize
	@model = Model("ActorHead.obj", "KnightSkin.png");

	// Arrange
	model.SetTranslation(Vec3f(0, 0, 2));
	model.SetRotation(Quaternion().SetFromEulerDegrees(0, 180, 0));
}

void Render(int id)
{
	Render::SetAlphaBlend(false);
	Render::SetZBuffer(true, true);
	Render::SetBackfaceCull(false);
	Render::ClearZ();

	camera.Render();
	model.Render();
}
