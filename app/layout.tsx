import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "入荷管理システム",
  description: "基幹CSVの取込から受取・照合までを一元管理",
  icons: {
    icon: "/favicon.svg",
    shortcut: "/favicon.svg",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ja">
      <body className="antialiased">{children}</body>
    </html>
  );
}
