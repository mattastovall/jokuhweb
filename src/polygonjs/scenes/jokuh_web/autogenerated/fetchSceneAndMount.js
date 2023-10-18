import { loadScene_jokuh_web } from "./loadScene.js";

export const fetchSceneAndMount_jokuh_web = async function (options = {}) {
  if (options && options.createViewer == null) {
    options.createViewer = true;
  }
  return loadScene_jokuh_web(options);
};
