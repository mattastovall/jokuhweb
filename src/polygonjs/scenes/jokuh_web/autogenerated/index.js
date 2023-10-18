import { fetchSceneAndMount_jokuh_web } from "./fetchSceneAndMount.js";

export async function loadSceneAndMount_jokuh_web(options) {
  const { publicPath, onProgress } = options;
  const domElement = options.domElement || "polygonjs-app-jokuh_web";
  const loadedData = await fetchSceneAndMount_jokuh_web({
    domElement,
    autoPlay: true,
    onProgress,
    sceneDataRoot: publicPath + "/polygonjs/scenes",
    assetsRoot: publicPath,
    libsRootPrefix: publicPath,
  });
  return loadedData;
}
