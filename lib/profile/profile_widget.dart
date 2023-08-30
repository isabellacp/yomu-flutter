import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_widget.dart';
import '/components/icon_button.dart';
import '/misc/theme.dart';
import '/misc/util.dart';
import '/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<AppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFEFDE8),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: Color(0xFF07CDD4),
              automaticallyImplyLeading: false,
              leading: CustomIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Yomu\nJournal',
                textAlign: TextAlign.center,
                style: CustomTheme.of(context).bodyMedium.override(
                      fontFamily: 'Single Day',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      lineHeight: 0.7,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 150,
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF07CDD4),
                                    Color(0xFFFEFDE8)
                                  ],
                                  stops: [0, 1],
                                  begin: AlignmentDirectional(0, -1),
                                  end: AlignmentDirectional(0, 1),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: CustomTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: CustomTheme.of(context)
                                          .secondaryBackground,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 4, 4, 4),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(
                                        'assets/images/Tony-Tony-Chopper-One-Piece.jpg',
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Text(
                          'Tony Tony Chopper',
                          style: CustomTheme.of(context).headlineSmall.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFFDD8E8C),
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          'Cotton-candy lover',
                          style: CustomTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                color: Color(0xC48EA0A4),
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 16, 12, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Text(
                                          AppState()
                                              .chapterRead
                                              .length
                                              .toString(),
                                          style: CustomTheme.of(context)
                                              .titleLarge,
                                        ),
                                      ),
                                      Text(
                                        'Total Chapters Read',
                                        textAlign: TextAlign.center,
                                        style:
                                            CustomTheme.of(context).labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Text(
                                          AppState()
                                              .favoritedManga
                                              .length
                                              .toString(),
                                          style: CustomTheme.of(context)
                                              .titleLarge,
                                        ),
                                      ),
                                      Text(
                                        'Favorites',
                                        style:
                                            CustomTheme.of(context).labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reading',
                              style: CustomTheme.of(context).titleLarge,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Builder(
                                    builder: (context) {
                                      final chapter =
                                          AppState().chapterReading.toList();
                                      if (chapter.isEmpty) {
                                        return Center(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: EmptyListWidget(),
                                          ),
                                        );
                                      }
                                      return ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          8,
                                          0,
                                          8,
                                          0,
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: chapter.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(width: 8),
                                        itemBuilder: (context, chapterIndex) {
                                          final chapterItem =
                                              chapter[chapterIndex];
                                          return Container(
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF8F9FE),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future:
                                                  GetMangaFromChapterCall.call(
                                                chapterId: getJsonField(
                                                  chapterItem,
                                                  r'''$.id''',
                                                ).toString(),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          CustomTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final columnGetMangaFromChapterResponse =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(8),
                                                        topRight:
                                                            Radius.circular(8),
                                                      ),
                                                      child: Image.network(
                                                        getJsonField(
                                                          columnGetMangaFromChapterResponse
                                                              .jsonBody,
                                                          r'''$.data.attributes.posterImage.original''',
                                                        ),
                                                        width: 150,
                                                        height: 120,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 8, 8, 8),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              columnGetMangaFromChapterResponse
                                                                  .jsonBody,
                                                              r'''$.data.attributes.canonicalTitle''',
                                                            ).toString(),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: CustomTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                          ),
                                                          Text(
                                                            'Volume: ${getJsonField(
                                                              chapterItem,
                                                              r'''$.attributes.volumeNumber''',
                                                            ).toString()}, Chapter: ${getJsonField(
                                                              chapterItem,
                                                              r'''$.attributes.number''',
                                                            ).toString()}',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: CustomTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: CustomTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4)),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 12)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Read',
                              style: CustomTheme.of(context).titleLarge,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Builder(
                                    builder: (context) {
                                      final chapter =
                                          AppState().chapterRead.toList();
                                      if (chapter.isEmpty) {
                                        return Center(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: EmptyListWidget(),
                                          ),
                                        );
                                      }
                                      return ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          8,
                                          0,
                                          8,
                                          0,
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: chapter.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(width: 8),
                                        itemBuilder: (context, chapterIndex) {
                                          final chapterItem =
                                              chapter[chapterIndex];
                                          return Container(
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF8F9FE),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future:
                                                  GetMangaFromChapterCall.call(
                                                chapterId: getJsonField(
                                                  chapterItem,
                                                  r'''$.id''',
                                                ).toString(),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          CustomTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final columnGetMangaFromChapterResponse =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(8),
                                                        topRight:
                                                            Radius.circular(8),
                                                      ),
                                                      child: Image.network(
                                                        getJsonField(
                                                          columnGetMangaFromChapterResponse
                                                              .jsonBody,
                                                          r'''$.data.attributes.posterImage.original''',
                                                        ),
                                                        width: 150,
                                                        height: 120,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 8, 8, 8),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              columnGetMangaFromChapterResponse
                                                                  .jsonBody,
                                                              r'''$.data.attributes.canonicalTitle''',
                                                            ).toString(),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style:
                                                                CustomTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: CustomTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                          ),
                                                          Text(
                                                            'Volume: ${getJsonField(
                                                              chapterItem,
                                                              r'''$.attributes.volumeNumber''',
                                                            ).toString()}, Chapter: ${getJsonField(
                                                              chapterItem,
                                                              r'''$.attributes.number''',
                                                            ).toString()}',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: CustomTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: CustomTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4)),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 12)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Favorites',
                              style: CustomTheme.of(context).titleLarge,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Builder(
                                    builder: (context) {
                                      final manga =
                                          AppState().favoritedManga.toList();
                                      if (manga.isEmpty) {
                                        return Center(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: EmptyListWidget(),
                                          ),
                                        );
                                      }
                                      return ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          8,
                                          0,
                                          8,
                                          0,
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: manga.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(width: 8),
                                        itemBuilder: (context, mangaIndex) {
                                          final mangaItem = manga[mangaIndex];
                                          return FutureBuilder<ApiCallResponse>(
                                            future: GetMangaCall.call(
                                              mangaId: mangaItem,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        CustomTheme.of(context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerGetMangaResponse =
                                                  snapshot.data!;
                                              return Container(
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF8F9FE),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'Details',
                                                      queryParameters: {
                                                        'mangaId':
                                                            serializeParam(
                                                          getJsonField(
                                                            containerGetMangaResponse
                                                                .jsonBody,
                                                            r'''$.data.id''',
                                                          ),
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        child: Image.network(
                                                          getJsonField(
                                                            containerGetMangaResponse
                                                                .jsonBody,
                                                            r'''$.data.attributes.posterImage.original''',
                                                          ),
                                                          width: 150,
                                                          height: 120,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 8,
                                                                    8, 8),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              getJsonField(
                                                                containerGetMangaResponse
                                                                    .jsonBody,
                                                                r'''$.data.attributes.canonicalTitle''',
                                                              ).toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: CustomTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: CustomTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 4)),
                                                        ),
                                                      ),
                                                    ],
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
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Color(0x70000000),
                            ),
                          ].divide(SizedBox(height: 12)),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonWidget(
                            onPressed: () async {
                              AppState().update(() {
                                AppState().favoritedManga = [];
                                AppState().chapterReading = [];
                                AppState().chapterRead = [];
                              });
                            },
                            text: 'Reset all data',
                            options: ButtonOptions(
                              height: 40,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: Color(0x00FFFFFF),
                              textStyle:
                                  CustomTheme.of(context).titleSmall.override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF666666),
                                      ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
