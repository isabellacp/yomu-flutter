import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/chapter_options_widget.dart';
import '/misc/theme.dart';
import '/misc/util.dart';
import '../components/icon_button.dart';
import '../components/widgets.dart';
import 'details_model.dart';

export 'details_model.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    Key? key,
    int? mangaId,
  })  : this.mangaId = mangaId ?? 1,
        super(key: key);

  final int mangaId;

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  late DetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<AppState>();

    return FutureBuilder<ApiCallResponse>(
      future: GetMangaCall.call(
        mangaId: widget.mangaId.toString(),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: CustomTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    CustomTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final detailsGetMangaResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: CustomTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: CustomIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: CustomTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Details',
              style: CustomTheme.of(context).headlineMedium,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                          color: CustomTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 12.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl: getJsonField(
                                    detailsGetMangaResponse.jsonBody,
                                    r'''$.data.attributes.posterImage.original''',
                                  ),
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.45,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      getJsonField(
                                        detailsGetMangaResponse.jsonBody,
                                        r'''$.data.attributes.canonicalTitle''',
                                      ).toString(),
                                      textAlign: TextAlign.start,
                                      maxLines: 3,
                                      style: CustomTheme.of(context)
                                          .headlineMedium,
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        getJsonField(
                                          detailsGetMangaResponse.jsonBody,
                                          r'''$.data.attributes.synopsis''',
                                        ).toString(),
                                        'No synopsis',
                                      ),
                                      maxLines: 9,
                                      style:
                                          CustomTheme.of(context).labelMedium,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: ButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: 'Share',
                                              icon: Icon(
                                                Icons.share_outlined,
                                                size: 15.0,
                                              ),
                                              options: ButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: CustomTheme.of(context)
                                                    .primary,
                                                textStyle:
                                                    CustomTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          if (AppState()
                                              .favoritedManga
                                              .contains(getJsonField(
                                                detailsGetMangaResponse
                                                    .jsonBody,
                                                r'''$.data.id''',
                                              ).toString()))
                                            CustomIconButton(
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor: Color(0x4CFFFFFF),
                                              icon: Icon(
                                                Icons.favorite,
                                                color: CustomTheme.of(context)
                                                    .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                setState(() {
                                                  AppState()
                                                      .removeFromFavoritedManga(
                                                          getJsonField(
                                                    detailsGetMangaResponse
                                                        .jsonBody,
                                                    r'''$.data.id''',
                                                  ).toString());
                                                });
                                              },
                                            ),
                                          if (!AppState()
                                              .favoritedManga
                                              .contains(getJsonField(
                                                detailsGetMangaResponse
                                                    .jsonBody,
                                                r'''$.data.id''',
                                              ).toString()))
                                            CustomIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor: Color(0x4CFFFFFF),
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: CustomTheme.of(context)
                                                    .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                setState(() {
                                                  AppState()
                                                      .addToFavoritedManga(
                                                          getJsonField(
                                                    detailsGetMangaResponse
                                                        .jsonBody,
                                                    r'''$.data.id''',
                                                  ).toString());
                                                });
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: GetMangaGenresCall.call(
                            mangaId: widget.mangaId.toString(),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      CustomTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final rowGetMangaGenresResponse = snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final genre = (GetMangaGenresCall.names(
                                          rowGetMangaGenresResponse.jsonBody,
                                        )?.toList() ??
                                        [])
                                    .take(7)
                                    .toList();
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(genre.length,
                                            (genreIndex) {
                                      final genreItem = genre[genreIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Container(
                                          height: 32.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x4D9489F5),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFF6F61EF),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Text(
                                                genreItem.toString(),
                                                style: CustomTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: Color(0xFF15161E),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                        .divide(SizedBox(width: 8.0))
                                        .addToStart(SizedBox(width: 16.0))
                                        .addToEnd(SizedBox(width: 16.0)),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Divider(
                        height: 36.0,
                        thickness: 1.0,
                        color: CustomTheme.of(context).alternate,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 0.0, 4.0),
                                  child: Text(
                                    'Releases',
                                    style: CustomTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF14181B),
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Latest releases',
                                    style: CustomTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF57636C),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: GetMangaChaptersCall.call(
                                      mangaId: widget.mangaId,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                CustomTheme.of(context).primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final listViewGetMangaChaptersResponse =
                                          snapshot.data!;
                                      return Builder(
                                        builder: (context) {
                                          final chapter = getJsonField(
                                            listViewGetMangaChaptersResponse
                                                .jsonBody,
                                            r'''$.data''',
                                          ).toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: chapter.length,
                                            itemBuilder:
                                                (context, chapterIndex) {
                                              final chapterItem =
                                                  chapter[chapterIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 1.0),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 0.0,
                                                        color:
                                                            Color(0xFFE0E3E7),
                                                        offset:
                                                            Offset(0.0, 1.0),
                                                      )
                                                    ],
                                                  ),
                                                  child: Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onLongPress: () async {
                                                          await showAlignedDialog(
                                                            context: context,
                                                            isGlobal: true,
                                                            avoidOverflow:
                                                                false,
                                                            targetAnchor:
                                                                AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                            followerAnchor:
                                                                AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                            builder:
                                                                (dialogContext) {
                                                              return Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    ChapterOptionsWidget(
                                                                  chapter:
                                                                      chapterItem,
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        12.0,
                                                                        12.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              4.0),
                                                                          child:
                                                                              Text(
                                                                            'Volume ${valueOrDefault<String>(
                                                                              getJsonField(
                                                                                chapterItem,
                                                                                r'''$.attributes.volumeNumber''',
                                                                              ).toString(),
                                                                              '0',
                                                                            )}, Chapter ${valueOrDefault<String>(
                                                                              getJsonField(
                                                                                chapterItem,
                                                                                r'''$.attributes.number''',
                                                                              ).toString(),
                                                                              '0',
                                                                            )}',
                                                                            style: CustomTheme.of(context).labelSmall.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  color: Color(0xFF57636C),
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      getJsonField(
                                                                                chapterItem,
                                                                                r'''$.attributes.canonicalTitle''',
                                                                              ) ==
                                                                              null
                                                                          ? 'No Title'
                                                                          : getJsonField(
                                                                              chapterItem,
                                                                              r'''$.attributes.canonicalTitle''',
                                                                            ).toString(),
                                                                      style: CustomTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Plus Jakarta Sans',
                                                                            color:
                                                                                Color(0xFF08D1D8),
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (getJsonField(
                                                                                chapterItem,
                                                                                r'''$.attributes.published''',
                                                                              ) !=
                                                                              null)
                                                                            Expanded(
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  'Released on ${valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      chapterItem,
                                                                                      r'''$.attributes.published''',
                                                                                    ).toString(),
                                                                                    'No release date',
                                                                                  )}',
                                                                                  'Unknown',
                                                                                ),
                                                                                style: CustomTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                      color: Color(0xFF14181B),
                                                                                      fontSize: 14.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
