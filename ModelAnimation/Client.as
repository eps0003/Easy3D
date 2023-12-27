#include "Utilities.as"
#include "Camera.as"
#include "Model.as"

#define CLIENT_ONLY

const float FOV = 90.0f;
const float RENDER_DISTANCE = 9999.0f;

Camera@ camera;
Model@ model;

void onInit(CRules@ this)
{
	GUI::SetFont("menu");
	Render::addScript(Render::layer_prehud, "Client.as", "Render", 0);

	@camera = Camera();
	@model = Model("ActorHead.obj", "KnightSkin.png");

	model.SetTranslation(Vec3f(0, 0, 2));

	Quaternion rotation;
	rotation.SetFromEulerDegrees(0, 180, 0);
	model.SetRotation(rotation);
}

void onRender(CRules@ this)
{
	GUI::DrawText("Position: " + camera.getPosition().toString(), Vec2f(10, 10), color_white);
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
