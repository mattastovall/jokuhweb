// mat
import { MeshBasicBuilderMatNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/mat/MeshBasicBuilder";
import { PointsBuilderMatNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/mat/PointsBuilder";
// obj
import { GeoObjNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/obj/Geo";
// sop
import { ActorSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Actor";
import { CircleSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Circle";
import { CopySopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Copy";
import { CurveFromPointsSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/CurveFromPoints";
import { CurveGetPointSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/CurveGetPoint";
import { FileOBJSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/FileOBJ";
import { FileSVGSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/FileSVG";
import { InstanceSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Instance";
import { MaterialsNetworkSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/MaterialsNetwork";
import { MergeSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Merge";
import { NoiseSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Noise";
import { ObjectPropertiesSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/ObjectProperties";
import { ParticlesSystemGpuSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/ParticlesSystemGpu";
import { PerspectiveCameraSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/PerspectiveCamera";
import { PointSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Point";
import { ResampleSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Resample";
import { RestAttributesSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/RestAttributes";
import { ScatterSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Scatter";
import { SphereSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Sphere";
import { TransformSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Transform";

// named functions
import { addNumber } from "@polygonjs/polygonjs/dist/src/engine/functions/addNumber";
import { catmullRomCurve3GetPoint } from "@polygonjs/polygonjs/dist/src/engine/functions/catmullRomCurve3GetPoint";
import { divideNumber } from "@polygonjs/polygonjs/dist/src/engine/functions/divideNumber";
import { divideVectorNumber } from "@polygonjs/polygonjs/dist/src/engine/functions/divideVectorNumber";
import { getActorNodeParamValue } from "@polygonjs/polygonjs/dist/src/engine/functions/getActorNodeParamValue";
import { getObject } from "@polygonjs/polygonjs/dist/src/engine/functions/getObject";
import { getObjectUserData } from "@polygonjs/polygonjs/dist/src/engine/functions/getObjectUserData";
import { getParam } from "@polygonjs/polygonjs/dist/src/engine/functions/getParam";
import { globalsTime } from "@polygonjs/polygonjs/dist/src/engine/functions/globalsTime";
import { globalsTimeDelta } from "@polygonjs/polygonjs/dist/src/engine/functions/globalsTimeDelta";
import { keyboardEventMatchesConfig } from "@polygonjs/polygonjs/dist/src/engine/functions/keyboardEventMatchesConfig";
import { mathFloat_2 } from "@polygonjs/polygonjs/dist/src/engine/functions/mathFloat_2";
import { mathFloat_4 } from "@polygonjs/polygonjs/dist/src/engine/functions/mathFloat_4";
import { mod } from "@polygonjs/polygonjs/dist/src/engine/functions/mod";
import { multAdd } from "@polygonjs/polygonjs/dist/src/engine/functions/multAdd";
import { multScalarVector3 } from "@polygonjs/polygonjs/dist/src/engine/functions/multScalarVector3";
import { particlesSystemReset } from "@polygonjs/polygonjs/dist/src/engine/functions/particlesSystemReset";
import { particlesSystemStepSimulation } from "@polygonjs/polygonjs/dist/src/engine/functions/particlesSystemStepSimulation";
import { previousValuePrimitive } from "@polygonjs/polygonjs/dist/src/engine/functions/previousValuePrimitive";
import { previousValueVector3 } from "@polygonjs/polygonjs/dist/src/engine/functions/previousValueVector3";
import { setParamFloat } from "@polygonjs/polygonjs/dist/src/engine/functions/setParamFloat";
import { setParamVector3 } from "@polygonjs/polygonjs/dist/src/engine/functions/setParamVector3";
import { sleep } from "@polygonjs/polygonjs/dist/src/engine/functions/sleep";
import { subtractNumber } from "@polygonjs/polygonjs/dist/src/engine/functions/subtractNumber";
import { subtractVector } from "@polygonjs/polygonjs/dist/src/engine/functions/subtractVector";
import { triggerTwoWaySwitch } from "@polygonjs/polygonjs/dist/src/engine/functions/triggerTwoWaySwitch";

export const requiredImports_jokuh_web = {
  nodes: [
    MeshBasicBuilderMatNode,
    PointsBuilderMatNode,
    GeoObjNode,
    ActorSopNode,
    CircleSopNode,
    CopySopNode,
    CurveFromPointsSopNode,
    CurveGetPointSopNode,
    FileOBJSopNode,
    FileSVGSopNode,
    InstanceSopNode,
    MaterialsNetworkSopNode,
    MergeSopNode,
    NoiseSopNode,
    ObjectPropertiesSopNode,
    ParticlesSystemGpuSopNode,
    PerspectiveCameraSopNode,
    PointSopNode,
    ResampleSopNode,
    RestAttributesSopNode,
    ScatterSopNode,
    SphereSopNode,
    TransformSopNode,
  ],
  operations: [],
  jsFunctions: [
    addNumber,
    catmullRomCurve3GetPoint,
    divideNumber,
    divideVectorNumber,
    getActorNodeParamValue,
    getObject,
    getObjectUserData,
    getParam,
    globalsTime,
    globalsTimeDelta,
    keyboardEventMatchesConfig,
    mathFloat_2,
    mathFloat_4,
    mod,
    multAdd,
    multScalarVector3,
    particlesSystemReset,
    particlesSystemStepSimulation,
    previousValuePrimitive,
    previousValueVector3,
    setParamFloat,
    setParamVector3,
    sleep,
    subtractNumber,
    subtractVector,
    triggerTwoWaySwitch,
  ],
};
