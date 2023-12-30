#include "Utilities.as"
#include "Camera.as"
#include "Model.as"
#include "Animator.as"
#include "IAnimation.as"
#include "TestAnimation.as"

#define CLIENT_ONLY

const float FOV = 90.0f;
const float RENDER_DISTANCE = 9999.0f;

Camera@ camera;
Model@ model;
Animator@ animator;

void onInit(CRules@ this)
{
	GUI::SetFont("menu");
	Render::addScript(Render::layer_prehud, "Client.as", "Render", 0);

	@camera = Camera();

	@model = Model("ActorHead.obj", "KnightSkin.png");
	model.SetTranslation(Vec3f(0, 0, 2));
	model.SetOrigin(Vec3f(0, 0.25f, 0));
	model.SetRotation(Quaternion().SetFromEulerDegrees(0, 180, 0));

	@animator = Animator(model);
	animator.RegisterAnimation("test1", TestAnimation1(model));
	animator.RegisterAnimation("test2", TestAnimation2(model));
	animator.SetAnimation("test1");
}

void onTick(CRules@ this)
{
	if (getControls().isKeyPressed(KEY_SPACE))
	{
		animator.SetAnimation("test2");
	}
	else
	{
		animator.SetAnimation("test1", 0);
	}
}

void onRender(CRules@ this)
{
	uint w = getScreenWidth();
	uint h = getScreenHeight();

	GUI::DrawRectangle(Vec2f(0, h * 0.5f - 1), Vec2f(w, h * 0.5f + 1), color_white);
	GUI::DrawRectangle(Vec2f(w * 0.5f - 1, 0), Vec2f(w * 0.5f + 1, h), color_white);

	GUI::DrawText("Position: " + camera.getPosition().toString(), Vec2f(10, 10), color_white);
}

void Render(int id)
{
	Render::SetAlphaBlend(false);
	Render::SetZBuffer(true, true);
	Render::SetBackfaceCull(false);
	Render::ClearZ();

	camera.Render();
	animator.Animate();
	model.Render();
}
