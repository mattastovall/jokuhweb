import { loadSceneData_jokuh_web } from "./loadSceneData.js";

export const loadScene_jokuh_web = async function (options = {}) {
  const {
    onProgress,
    domElement,
    configureSceneData,
    autoPlay,
    createViewer,
    sceneDataRoot,
    assetsRoot,
    libsRootPrefix,
    printWarnings,
    renderer,
    cameraMaskOverride,
  } = options;
  let sceneData = options.sceneData;

  const runRegister = options.runRegister != null ? options.runRegister : true;
  const loadModules = options.loadModules != null ? options.loadModules : true;

  const moduleNames = loadModules ? [] : [];
  const promises = [
    import("./loadSceneFromSceneData.js"),
    sceneData == null
      ? loadSceneData_jokuh_web({ onProgress, sceneDataRoot })
      : (() => {
          return new Promise((resolve) => resolve());
        })(),
  ];
  const results = await Promise.all(promises);
  const { Poly, loadSceneFromSceneData_jokuh_web } = results[0];
  if (sceneData == null) {
    sceneData = results[1];
  }
  if (configureSceneData) {
    configureSceneData(sceneData);
  }

  const loadedModules = [];
  for (let i = 2; i < results.length; i++) {
    loadedModules.push(results[i]);
  }
  // register modules
  let i = 0;
  for (let moduleName of moduleNames) {
    const moduleNameContainer = moduleName + "Module";
    Poly.registerModule(loadedModules[i][moduleNameContainer], printWarnings);
    i++;
  }

  const loadedData = await loadSceneFromSceneData_jokuh_web({
    onProgress,
    sceneData,
    domElement,
    runRegister,
    autoPlay,
    createViewer,
    assetsRoot,
    libsRootPrefix,
    printWarnings,
    renderer,
    cameraMaskOverride,
  });
  return loadedData;
};
