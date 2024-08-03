import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MediaItem extends StatefulWidget {
  final String mediaUrl;
  final bool isVideo;
  final VoidCallback onVideoFinish;

  const MediaItem({
    super.key,
    required this.mediaUrl,
    required this.isVideo,
    required this.onVideoFinish,
  });

  @override
  _MediaItemState createState() => _MediaItemState();
}

class _MediaItemState extends State<MediaItem> {
  VideoPlayerController? _videoController;
  bool _isInitialized = false;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    if (widget.isVideo) {
      _videoController =
          VideoPlayerController.networkUrl(Uri.parse(widget.mediaUrl))
            ..initialize().then((_) {
              setState(() {
                _isInitialized = true;
              });
              _videoController!.play();
              _videoController!.setVolume(0.0);
              _videoController!.addListener(() {
                if (_videoController!.value.position ==
                    _videoController!.value.duration) {
                  widget
                      .onVideoFinish(); // Notificar cuando el video ha terminado
                }
              });
            }).catchError((error) {
              // Manejar errores de carga del video aquí
              if (kDebugMode) {
                print('Error loading video: $error');
              }
            });
    }
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _videoController!.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isVideo
        ? Stack(
            fit: StackFit.expand,
            children: [
              _isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoController!.value.aspectRatio,
                      child: VideoPlayer(_videoController!),
                    )
                  : const Center(child: CircularProgressIndicator()),
              Positioned(
                bottom: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    size: 40,
                    _isMuted ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                  ),
                  onPressed: _toggleMute,
                ),
              ),
            ],
          )
        : Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.mediaUrl),
                fit: BoxFit.cover,
              ),
            ),
          );
  }

  @override
  void dispose() {
    if (widget.isVideo) {
      _videoController?.dispose();
    }
    super.dispose();
  }
}
