extension Chunk<T> on List<T> {
  List<List<T>> chunk([int size = 2]) {
    List<List<T>> chunks = [];

    for (var i = 0; i + size <= length; i += size) {
      chunks.add(this.sublist(i, i + size));
    }

    return chunks;
  }
}
