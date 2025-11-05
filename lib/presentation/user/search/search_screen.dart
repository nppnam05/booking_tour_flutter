import 'package:booking_tour_flutter/data/booking_repository.dart';
import 'package:booking_tour_flutter/presentation/user/search/cubit/search_cubit.dart';
import 'package:booking_tour_flutter/presentation/user/search/cubit/search_state.dart';
import 'package:booking_tour_flutter/presentation/user/search/search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(), 
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          final cubit = context.read<SearchCubit>();

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              title: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Nhập tên địa điểm...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Color.fromARGB(255, 239, 236, 236)),
                ),
                onSubmitted: (_) =>
                    cubit.searchTrips(_searchController.text.trim()),
                textInputAction: TextInputAction.search,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_alt_outlined),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Bộ lọc sẽ được thêm sau'),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: _buildBody(context, state, cubit),
          );
        },
      ),
    );
  }


  Widget _buildBody(
      BuildContext context, SearchState state, SearchCubit cubit) {
 
    if (state is SearchInitial) {
  if (state.history.isEmpty) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Nhập từ khóa để tìm kiếm tour',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  } else {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Lịch sử tìm kiếm',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...state.history.map((keyword) => ListTile(
              leading: const Icon(Icons.history),
              title: Text(keyword),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => cubit.removeFromHistory(keyword),
              ),
              onTap: () {
                _searchController.text = keyword;
                cubit.searchTrips(keyword);
              },
            )),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: cubit.clearHistory,
          icon: const Icon(Icons.delete_forever),
          label: const Text('Xóa toàn bộ lịch sử'),
        ),  
      ],
    );
  }
}


    
    if (state is SearchLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is SearchError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 80, color: Colors.red[300]),
            const SizedBox(height: 16),
            Text(
              state.message,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () =>
                  cubit.searchTrips(_searchController.text.trim()),
              icon: const Icon(Icons.refresh),
              label: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }
    if (state is SearchLoaded) {
      final trips = state.trips;

      if (trips.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
              const SizedBox(height: 16),
              Text(
                'Không tìm thấy kết quả',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 8),
              Text(
                'Thử với từ khóa khác',
                style: TextStyle(fontSize: 14, color: Colors.grey[500]),
              ),
            ],
          ),
        );
      }

      return Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            color: Colors.grey[100],
            child: Text(
              'Tìm thấy ${trips.length} kết quả',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                return SearchCard(trip: trips[index]);
              },
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }
}
