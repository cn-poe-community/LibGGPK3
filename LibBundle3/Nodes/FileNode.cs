﻿using LibBundle3.Records;
using System.IO;

namespace LibBundle3.Nodes {
	public class FileNode : IFileNode {
		public virtual string Name { get; }

		public virtual DirectoryNode Parent { get; }
		ITreeNode? ITreeNode.Parent => Parent;

		public FileRecord Record { get; }

		protected FileNode(FileRecord record, DirectoryNode parent) {
			Name = Path.GetFileName(record.Path);
			Parent = parent;
			Record = record;
		}

		protected internal static IFileNode CreateInstance(FileRecord record, IDirectoryNode parent) {
			return new FileNode(record, (DirectoryNode)parent);
		}
	}
}