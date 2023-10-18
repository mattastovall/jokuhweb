import { SceneDataManifestImporter } from "@polygonjs/polygonjs/dist/src/engine/io/manifest/import/SceneData";
const manifest = {
  properties: "1697571394573",
  root: "1697490993192",
  nodes: {
    particles1: "1697574408513",
    "particles1/MAT": "1697482266919",
    "particles1/MAT/meshBasicBuilder_INSTANCES": "1697490265484",
    "particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES": "1697491243904",
    "particles1/MAT/pointsParticles": "1697483115727",
    "particles1/actor_particles1": "1697482266919",
    "particles1/particlesSystemGpu1": "1697574408513",
    "particles1/actor2": "1697482266919",
    "particles1/actor4": "1697509618304",
    cameras2: "1697482266919",
    geo1: "1697574408513",
    "geo1/MAT": "1697512138024",
    "geo1/MAT/meshLambertBuilder_INSTANCES": "1697512138024",
    "geo1/animationsNetwork1": "1697515761523",
    "geo1/actor1": "1697574408513",
  },
  shaders: {
    "/particles1/MAT/meshBasicBuilder_INSTANCES": {
      vertex: "1697490196936",
      fragment: "1697490196936",
      "customDepthMaterial.vertex": "1697490196936",
      "customDepthMaterial.fragment": "1697490196936",
      "customDistanceMaterial.vertex": "1697490196936",
      "customDistanceMaterial.fragment": "1697490196936",
      "customDepthDOFMaterial.vertex": "1697490196936",
      "customDepthDOFMaterial.fragment": "1697490196936",
    },
    "/particles1/MAT/meshBasicBuilder_INSTANCES_PARTICLES": {
      vertex: "1697490196936",
      fragment: "1697490196936",
      "customDepthMaterial.vertex": "1697490196936",
      "customDepthMaterial.fragment": "1697490196936",
      "customDistanceMaterial.vertex": "1697490196936",
      "customDistanceMaterial.fragment": "1697490196936",
      "customDepthDOFMaterial.vertex": "1697490196936",
      "customDepthDOFMaterial.fragment": "1697490196936",
    },
    "/particles1/MAT/pointsParticles": {
      vertex: "1697483115727",
      fragment: "1697483115727",
      "customDistanceMaterial.vertex": "1697483115727",
      "customDistanceMaterial.fragment": "1697483115727",
      "customDepthMaterial.vertex": "1697483115727",
      "customDepthMaterial.fragment": "1697483115727",
      "customDepthDOFMaterial.vertex": "1697483115727",
      "customDepthDOFMaterial.fragment": "1697483115727",
    },
    "/particles1/particlesSystemGpu1": {
      instancePosition_x_state: "1697483115727",
      velocity: "1697483115727",
    },
    "/geo1/MAT/meshLambertBuilder_INSTANCES": {
      vertex: "1697483115727",
      fragment: "1697483115727",
      "customDepthMaterial.vertex": "1697483115727",
      "customDepthMaterial.fragment": "1697483115727",
      "customDistanceMaterial.vertex": "1697483115727",
      "customDistanceMaterial.fragment": "1697483115727",
      "customDepthDOFMaterial.vertex": "1697483115727",
      "customDepthDOFMaterial.fragment": "1697483115727",
    },
  },
  jsFunctionBodies: {
    "/particles1/actor_particles1": "1697483115727",
    "/particles1/actor2": "1697483115727",
    "/particles1/actor4": "1697483115727",
    "/geo1/actor1": "1697483115727",
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
