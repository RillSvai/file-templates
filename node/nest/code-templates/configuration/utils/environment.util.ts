import { Stage } from "../enums/stage.enum";

export abstract class EnvironmentUtil {
  public static getStage() {
    const stage = process.env.NODE_ENV || "";
    stage.toLowerCase();

    switch (stage) {
      case Stage.Development:
        return Stage.Development;
      case Stage.Production:
        return Stage.Production;
      case Stage.Staging:
        return Stage.Staging;
      case Stage.Qa:
        return Stage.Qa;
      case Stage.Test:
        return Stage.Test;
      default:
        return Stage.Default;
    }
  }
}
