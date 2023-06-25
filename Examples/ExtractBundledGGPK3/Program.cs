﻿using LibBundledGGPK;
using System;
using System.IO;
using System.Reflection;

namespace ExtractBundledGGPK3 {
	public class Program {
		public static int Main(string[] args) {
#if !DEBUG
			try {
#endif
				var version = Assembly.GetExecutingAssembly().GetName().Version!;
				Console.WriteLine($"ExtractBundledGGPK3 (v{version.Major}.{version.Minor}.{version.Build})  Copyright (C) 2022 aianlinb"); // ©
				Console.WriteLine();
				if (args.Length != 3) {
					Console.WriteLine("Usage: ExtractBundledGGPK3 <PathToGGPK> <PathToExtract> <PathToSave>");
					return 1;
				}
				if (!File.Exists(args[0])) {
					Console.WriteLine("FileNotFound: " + args[0]);
					return 1;
				}

				Console.WriteLine("GGPK: " + args[0]);
				Console.WriteLine("Path to extract: " + args[1]);
				Console.WriteLine("Path to save: " + args[2]);
				Console.WriteLine("Reading ggpk file . . .");
				var ggpk = new BundledGGPK(args[0]);
				Console.WriteLine("Searching files . . .");
				var node = ggpk.Index.FindNode(args[1]);
				if (node == null) {
					Console.WriteLine("Not found in GGPK: " + args[1]);
					return 1;
				}
				Console.WriteLine("Extracting files . . .");
				ggpk.Index.Extract(node, args[2]);
				ggpk.Dispose();
				Console.WriteLine("Done!");
#if !DEBUG
			} catch (Exception e) {
				Console.Error.WriteLine(e);
				return 1;
			}
#endif
		return 0;
		}
	}
}