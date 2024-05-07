Return-Path: <linux-watchdog+bounces-1040-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB38BDF6A
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 May 2024 12:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23680B2446E
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 May 2024 10:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D7814F9E7;
	Tue,  7 May 2024 10:08:20 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2D014EC43
	for <linux-watchdog@vger.kernel.org>; Tue,  7 May 2024 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715076500; cv=none; b=PiVthpse3wwLzy04bjBLvw8APEyKYBryAwf4qOangtRZVggItPcp55Kjo0vaazdBFTzmXyxRspRd1eRmryLZ+S1Af5ueloWpGZw8pcXfQc6CH0cETcWBfS/sskgI9HC8o4FxXb7r5N+NDbe4es/3PXgEG3LclJgs4mgjwfF2jo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715076500; c=relaxed/simple;
	bh=f4d9Fh8eoRz2byJ+fQ9qpBft/VuDQjnlCNF03HfpbmI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iAY4dwoAdxKQ73gSo2+x38gsub7FcoGDzMeNd4RrBvrJlMQRqEEONx0m+KUDjb3pYAKaYOMNMOpjP/zv1qc7/nu6OtZBrdK0NN6pZvhIkqfFyGM1u040m1SuPOHnnVplWdo1Oy5YvP9vdL9BItLFKRfIvCLqOJJ3hNM0Yvbk39M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4VYYr901hCz4x1ls
	for <linux-watchdog@vger.kernel.org>; Tue, 07 May 2024 12:08:09 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:398:903d:bd3d:c943])
	by andre.telenet-ops.be with bizsmtp
	id LA802C00409Bz8w01A801o; Tue, 07 May 2024 12:08:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s4Hj5-00C50P-TE;
	Tue, 07 May 2024 12:08:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s4Hjs-00DhCc-1x;
	Tue, 07 May 2024 12:08:00 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	David Ober <dober@lenovo.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] watchdog: LENOVO_SE10_WDT should depend on X86 && DMI
Date: Tue,  7 May 2024 12:07:56 +0200
Message-Id: <58005595a05ef803b454b78d3ae9b8ee0675bd5d.1715076440.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo SE10 watchdog is only present on Lenovo ThinkEdge SE10
platforms, which are based on Intel Atom SoCs, and its driver relies on
DMI tables.  Hence add dependencies on X86 && DMI, to prevent asking the
user about this driver when configuring a kernel without Intel Atom or
DMI support.

While at it, fix the odd indentation (spaces instead of TABs).

Fixes: 1f6602c8ed1eccac ("watchdog: lenovo_se10_wdt: Watchdog driver for Lenovo SE10 platform")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/watchdog/Kconfig | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 24dfecbb30157fff..f002e9627c076f1f 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -255,14 +255,15 @@ config GPIO_WATCHDOG_ARCH_INITCALL
 	  If in doubt, say N.
 
 config LENOVO_SE10_WDT
-        tristate "Lenovo SE10 Watchdog"
-        select WATCHDOG_CORE
-        help
-          If you say yes here you get support for the watchdog
-          functionality for the Lenovo SE10 platform.
-
-          This driver can also be built as a module. If so, the module
-          will be called lenovo-se10-wdt.
+	tristate "Lenovo SE10 Watchdog"
+	depends on (X86 && DMI) || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  If you say yes here you get support for the watchdog
+	  functionality for the Lenovo SE10 platform.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called lenovo-se10-wdt.
 
 config MENF21BMC_WATCHDOG
 	tristate "MEN 14F021P00 BMC Watchdog"
-- 
2.34.1


