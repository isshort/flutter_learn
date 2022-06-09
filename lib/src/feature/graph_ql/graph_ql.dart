import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const document = """
  query products{
    products(first: 10, channel: "default-channel") {
    edges {
      node {
        id
        name
        slug
      }
    }
  }
  }
""";

class GraphQl extends StatelessWidget {
  const GraphQl({super.key});

  void data() async {
    await initHiveForFlutter();

    final HttpLink httpLink = HttpLink(
      'https://api.github.com/graphql/',
    );
    //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
    final AuthLink authLink = AuthLink(
      getToken: () => 'Bearer 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',
    );
    final Link link = authLink.concat(httpLink);
    ValueNotifier<GraphQLClient> client =
        ValueNotifier(GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore())));
  }

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink('https://demo.saleor.io/graphql/');
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(
          store: InMemoryStore(),
        ),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: Scaffold(
        appBar: AppBar(),
        body: Query(
          options: QueryOptions(
            document: gql(document),
          ),
          builder: (QueryResult result, {fetchMore, refetch}) {
            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (result.data == null) {
              return const Text('No Data Found');
            }
            return ListView.builder(itemBuilder: (BuildContext context, index) {
              print(result.data?['products']['edges']);
              return const ListTile(
                title: Text('asdf '),
              );
            });
            // print("your resul it $result");
            // return Text('data');
          },
        ),
      ),
    );
  }
}
