// anim
import { DurationAnimNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/anim/Duration";
import { EasingAnimNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/anim/Easing";
import { NullAnimNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/anim/Null";
import { PlayAnimNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/anim/Play";
import { PropertyNameAnimNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/anim/PropertyName";
import { PropertyValueAnimNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/anim/PropertyValue";
import { TargetAnimNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/anim/Target";
// mat
import { MeshBasicBuilderMatNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/mat/MeshBasicBuilder";
import { MeshLambertBuilderMatNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/mat/MeshLambertBuilder";
import { PointsBuilderMatNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/mat/PointsBuilder";
// obj
import { AmbientLightObjNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/obj/AmbientLight";
import { GeoObjNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/obj/Geo";
// sop
import { ActorSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Actor";
import { AnimationsNetworkSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/AnimationsNetwork";
import { AttribPromoteSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/AttribPromote";
import { CopySopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Copy";
import { CurveGetPointSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/CurveGetPoint";
import { FileOBJSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/FileOBJ";
import { FileSVGSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/FileSVG";
import { InstanceSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Instance";
import { MaterialsNetworkSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/MaterialsNetwork";
import { NoiseSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Noise";
import { ParticlesSystemGpuSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/ParticlesSystemGpu";
import { PerspectiveCameraSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/PerspectiveCamera";
import { PointSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Point";
import { RestAttributesSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/RestAttributes";
import { ScatterSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Scatter";
import { SphereSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Sphere";
import { TransformSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Transform";

// named functions
import { addNumber } from "@polygonjs/polygonjs/dist/src/engine/functions/addNumber";
import { divideVectorNumber } from "@polygonjs/polygonjs/dist/src/engine/functions/divideVectorNumber";
import { easeO2 } from "@polygonjs/polygonjs/dist/src/engine/functions/easeO2";
import { floatToVec3 } from "@polygonjs/polygonjs/dist/src/engine/functions/floatToVec3";
import { getParam } from "@polygonjs/polygonjs/dist/src/engine/functions/getParam";
import { globalsTime } from "@polygonjs/polygonjs/dist/src/engine/functions/globalsTime";
import { globalsTimeDelta } from "@polygonjs/polygonjs/dist/src/engine/functions/globalsTimeDelta";
import { keyboardEventMatchesConfig } from "@polygonjs/polygonjs/dist/src/engine/functions/keyboardEventMatchesConfig";
import { mathFloat_1 } from "@polygonjs/polygonjs/dist/src/engine/functions/mathFloat_1";
import { multNumber } from "@polygonjs/polygonjs/dist/src/engine/functions/multNumber";
import { multScalarVector3 } from "@polygonjs/polygonjs/dist/src/engine/functions/multScalarVector3";
import { noiseImprovedVector3 } from "@polygonjs/polygonjs/dist/src/engine/functions/noiseImprovedVector3";
import { noiseSimplexVector3 } from "@polygonjs/polygonjs/dist/src/engine/functions/noiseSimplexVector3";
import { particlesSystemReset } from "@polygonjs/polygonjs/dist/src/engine/functions/particlesSystemReset";
import { particlesSystemStepSimulation } from "@polygonjs/polygonjs/dist/src/engine/functions/particlesSystemStepSimulation";
import { previousValueVector3 } from "@polygonjs/polygonjs/dist/src/engine/functions/previousValueVector3";
import { random } from "@polygonjs/polygonjs/dist/src/engine/functions/random";
import { setObjectAttribute } from "@polygonjs/polygonjs/dist/src/engine/functions/setObjectAttribute";
import { setObjectPosition } from "@polygonjs/polygonjs/dist/src/engine/functions/setObjectPosition";
import { setParamVector3 } from "@polygonjs/polygonjs/dist/src/engine/functions/setParamVector3";
import { sleep } from "@polygonjs/polygonjs/dist/src/engine/functions/sleep";
import { subtractVector } from "@polygonjs/polygonjs/dist/src/engine/functions/subtractVector";

export const requiredImports_jokuh_web = {
  nodes: [
    DurationAnimNode,
    EasingAnimNode,
    NullAnimNode,
    PlayAnimNode,
    PropertyNameAnimNode,
    PropertyValueAnimNode,
    TargetAnimNode,
    MeshBasicBuilderMatNode,
    MeshLambertBuilderMatNode,
    PointsBuilderMatNode,
    AmbientLightObjNode,
    GeoObjNode,
    ActorSopNode,
    AnimationsNetworkSopNode,
    AttribPromoteSopNode,
    CopySopNode,
    CurveGetPointSopNode,
    FileOBJSopNode,
    FileSVGSopNode,
    InstanceSopNode,
    MaterialsNetworkSopNode,
    NoiseSopNode,
    ParticlesSystemGpuSopNode,
    PerspectiveCameraSopNode,
    PointSopNode,
    RestAttributesSopNode,
    ScatterSopNode,
    SphereSopNode,
    TransformSopNode,
  ],
  operations: [],
  jsFunctions: [
    addNumber,
    divideVectorNumber,
    easeO2,
    floatToVec3,
    getParam,
    globalsTime,
    globalsTimeDelta,
    keyboardEventMatchesConfig,
    mathFloat_1,
    multNumber,
    multScalarVector3,
    noiseImprovedVector3,
    noiseSimplexVector3,
    particlesSystemReset,
    particlesSystemStepSimulation,
    previousValueVector3,
    random,
    setObjectAttribute,
    setObjectPosition,
    setParamVector3,
    sleep,
    subtractVector,
  ],
};
