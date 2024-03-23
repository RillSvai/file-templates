import { ApolloDriverConfig } from '@nestjs/apollo';
import { Injectable } from '@nestjs/common';
import { GqlOptionsFactory } from '@nestjs/graphql';
import { ProductsModule } from 'src/products/products.module';

@Injectable()
export class GqlConfig implements GqlOptionsFactory {
  createGqlOptions(): ApolloDriverConfig {
    return {
      playground: true,
      include: [ProductsModule],
      autoSchemaFile: './src/common/gql/schema.graphql',
      sortSchema: true,
    };
  }
}
