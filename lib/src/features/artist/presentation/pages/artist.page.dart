import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotiflutter/src/core/theme/app.theme.dart';
import 'package:spotiflutter/src/features/artist/domain/entities/artist.entity.dart';
import 'package:spotiflutter/src/core/extensions/string.extension.dart';
import 'package:spotiflutter/src/core/extensions/number.extension.dart';

class ArtistPage extends StatefulWidget {
  static String routeName = '/artist';
  final Artist artist;

  const ArtistPage({
    Key? key,
    required this.artist,
  }) : super(key: key);

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.sizeOf(context).height * 0.45,
            floating: false,
            pinned: true,
            backgroundColor: AppTheme.colors.black,
            elevation: 0,
            leading: GestureDetector(
              onTap: ()=> Navigator.of(context).pop(),
              child: const Icon(Icons.chevron_left),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.artist.name ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: AppTheme.fontFamily.bold,
                  color: Colors.white,
                  fontSize: 16
                ),
                overflow: TextOverflow.ellipsis,
              ),
              centerTitle: true,
              titlePadding: const EdgeInsets.only(left: 10, bottom: 16),
              background: CachedNetworkImage(
                imageBuilder: (context, imageProvider) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.3),
                              Colors.black.withOpacity(0.9),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                imageUrl: widget.artist.images?.firstOrNull?.url ?? '',
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade800,
                    ),
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey.shade800,
                    AppTheme.colors.black,
                    AppTheme.colors.black,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.artist.followers?.total.toString().formatFollowers()} Followers',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white, width: 0.5),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 7,
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        const SizedBox(width: 25),
                        const Icon(
                          Icons.more_horiz,
                          size: 25,
                          color: Colors.grey,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.shuffle,
                          size: 25,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 25),
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.colors.primary,
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: AppTheme.colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                int min = 1000000;
                int max = 15000000;
                return ListTile(
                  title: Text(
                    'Track ${(index + 1).toString().padLeft(2, '0')}',
                  ),
                  subtitle: Text((Random().nextInt(max - min + 1) + min).format()),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade800,
                    ),
                  ),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
