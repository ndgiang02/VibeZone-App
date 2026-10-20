import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final _formKey = GlobalKey<FormState>();

  String? _songName;
  String? _artistName;
  String? _genre;
  String? _audioFilePath;
  String? _coverImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Song'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Song name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Song Title',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _songName = value,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),

              // Artist
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Artist Name',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _artistName = value,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),

              // Genre
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Genre',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _genre = value,
              ),
              const SizedBox(height: 16),

              // Upload Cover Image
              TextButton.icon(
                icon: const Icon(Icons.image),
                label: const Text('Choose Cover Image'),
                onPressed: () {
                  // TODO: Implement pick image
                },
              ),
              if (_coverImagePath != null)
                Image.asset(_coverImagePath!, height: 120),
              const SizedBox(height: 12),

              // Upload Audio File
              TextButton.icon(
                icon: const Icon(Icons.music_note),
                label: const Text('Choose Audio File'),
                onPressed: () {
                  // TODO: Implement pick audio
                },
              ),
              if (_audioFilePath != null)
                Text(
                  'Selected: ${_audioFilePath!.split('/').last}',
                  style: const TextStyle(fontSize: 14),
                ),

              const SizedBox(height: 24),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Upload'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // TODO: Implement upload logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Uploading...')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
