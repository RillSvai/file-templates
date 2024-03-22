import * as joi from "joi";
import { join } from "path";
import { EnvironmentUtil } from "./environment.util";

export abstract class ConfigurationUtil {
  public static getEnvPath() {
    const cwd = process.cwd();
    const path = join(cwd, "envs", `.env.${EnvironmentUtil.getStage()}`);

    return path;
  }

  public static getValidationSchema() {
    const schema = joi.object({
      HTTP_PORT: joi.number().required().min(0).max(65535),
      POSTGRES_USER: joi.string().required(),
      POSTGRES_PASSWORD: joi.string().required(),
      POSTGRES_DB: joi.string().required(),
      POSTGRES_PORT: joi.number().required().min(0).max(65535),
      POSTGRES_HOST: joi.string().required(),
      POSTGRES_MAX_CLIENT_CONNECTIONS: joi.number().required().min(5),
    });

    return schema;
  }
}
