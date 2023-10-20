import { SceneDataManifestImporter } from "@polygonjs/polygonjs/dist/src/engine/io/manifest/import/SceneData";
const manifest = {
  properties: "1697836078651",
  root: "1697835937670",
  nodes: {
    particles1: "1697835883013",
    "particles1/MAT": "1697822319282",
    "particles1/MAT/meshBasicBuilder_INSTANCES": "1697822319282",
    "particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES": "1697835883013",
    "particles1/MAT/pointsParticles": "1697822319282",
    "particles1/actor_particles1": "1697822319282",
    "particles1/particlesSystemGpu1": "1697836078651",
    "particles1/actor4": "1697836078651",
    cameras2: "1697822319282",
  },
  shaders: {
    "/particles1/MAT/meshBasicBuilder_INSTANCES": {
      vertex: "1697822548271",
      fragment: "1697822548271",
      "customDepthMaterial.vertex": "1697822548271",
      "customDepthMaterial.fragment": "1697822548271",
      "customDistanceMaterial.vertex": "1697822548271",
      "customDistanceMaterial.fragment": "1697822548271",
      "customDepthDOFMaterial.vertex": "1697822548271",
      "customDepthDOFMaterial.fragment": "1697822548271",
    },
    "/particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES": {
      vertex: "1697822548271",
      fragment: "1697822548271",
      "customDepthMaterial.vertex": "1697822548271",
      "customDepthMaterial.fragment": "1697822548271",
      "customDistanceMaterial.vertex": "1697822548271",
      "customDistanceMaterial.fragment": "1697822548271",
      "customDepthDOFMaterial.vertex": "1697822548271",
      "customDepthDOFMaterial.fragment": "1697822548271",
    },
    "/particles1/MAT/pointsParticles": {
      vertex: "1697822548271",
      fragment: "1697822548271",
      "customDistanceMaterial.vertex": "1697822548271",
      "customDistanceMaterial.fragment": "1697822548271",
      "customDepthMaterial.vertex": "1697822548271",
      "customDepthMaterial.fragment": "1697822548271",
      "customDepthDOFMaterial.vertex": "1697822548271",
      "customDepthDOFMaterial.fragment": "1697822548271",
    },
    "/particles1/particlesSystemGpu1": {
      instancePosition_x_state: "1697822548271",
      velocity: "1697822548271",
    },
  },
  jsFunctionBodies: {
    "/particles1/actor_particles1": "1697822548271",
    "/particles1/actor4": "1697822548271",
  },
};

export const loadSceneData_jokuh_web = async (options = {}) => {
  const sceneDataRoot = options.sceneDataRoot || "./polygonjs/scenes";
  return await SceneDataManifestImporter.importSceneData({
    sceneName: "jokuh_web",
    urlPrefix: sceneDataRoot + "/jokuh_web",
    manifest: manifest,
    onProgress: options.onProgress,
  });
};
