shared class Model
{
	private SMesh mesh;
	private string texture;

	private Vec3f origin;
	private Vec3f translation;
	private Quaternion rotation;
	private Vec3f scale = Vec3f(1);

	Model(string modelPath, string texture)
	{
		mesh.LoadObjIntoMesh(modelPath);
		SetMaterial(texture);
	}

	private void SetMaterial(string texture)
	{
		if (this.texture == texture) return;

		this.texture = texture;

		SMaterial material;
		material.AddTexture(texture);
		material.SetFlag(SMaterial::LIGHTING, false);
		material.SetFlag(SMaterial::BILINEAR_FILTER, false);
		material.SetFlag(SMaterial::BACK_FACE_CULLING, false);
		material.SetFlag(SMaterial::FOG_ENABLE, true);
		material.SetMaterialType(SMaterial::TRANSPARENT_ALPHA_CHANNEL_REF);

		mesh.SetMaterial(material);
	}

	void SetOrigin(Vec3f origin)
	{
		this.origin = origin;
	}

	void SetTranslation(Vec3f translation)
	{
		this.translation = translation;
	}

	void SetRotation(Quaternion rotation)
	{
		this.rotation = rotation;
	}

	void SetScale(Vec3f scale)
	{
		this.scale = scale;
	}

	void SetTexture(string texture)
	{
		SetMaterial(texture);
	}

	void Render()
	{
		CMatrix positionMatrix, rotationMatrix, originMatrix, scaleMatrix;

		positionMatrix.SetTranslation(translation);
		rotationMatrix.SetRotationRadians(-rotation.toEulerRadians());
		originMatrix.SetTranslation(-origin);
		scaleMatrix.SetScale(scale);

		// https://www.opengl-tutorial.org/beginners-tutorials/tutorial-3-matrices/#cumulating-transformations
		CMatrix matrix = positionMatrix * (rotationMatrix * scaleMatrix * originMatrix);
		Render::SetModelTransform(matrix.toArray());

		mesh.RenderMeshWithMaterial();
	}
}
