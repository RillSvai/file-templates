import { Module } from "@nestjs/common";
import { ConfigurationUtil } from "./utils/configuration.util";
import { ConfigModule } from "@nestjs/config";

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: ConfigurationUtil.getEnvPath(),
      validationSchema: ConfigurationUtil.getValidationSchema(),
    }),
  ],
})
export class ConfigurationModule {}
