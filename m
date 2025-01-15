Return-Path: <linux-watchdog+bounces-2716-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F616A11FF9
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2025 11:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77D4F3A1E52
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2025 10:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD43248BCC;
	Wed, 15 Jan 2025 10:39:37 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EC5241684;
	Wed, 15 Jan 2025 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937576; cv=none; b=R0uw9FxUgzYHqMt3jwojB6yzktKpH2TCoc9hxn1yoWzYwxpSkvkGGiWE1AIGtLtc7W67cZTKIKefLU3a+5M5Abk4e2qKsbSCgOAOc6d+A1d15uR5e2nfSqt52/jfUDjwV67ihjKiz/tVce26GamIqFCOgqeGKGRahDtJSX2+qn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937576; c=relaxed/simple;
	bh=DIdC8JmRX398dfENcqSIXkvY+Tkv7BlV11AYZ4Doo8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXuV1RWzrbqTgvBVQmY/BlwiSTopngKBUtOi/0/A7vmxp27wLQGkkHHtruwpVW+Wn1odjSA4t5D5JwCJMvP5Z6/jdK1sH/8NNqNeqs/wtt0k0QGaaEoqzEqnq5b3cunh9n9j2gAZlNuqt78JPiMVJjU3+k9SCalfWqgOhhCcdtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: L7g5iA6MSEmyVqeMIYeFkw==
X-CSE-MsgGUID: sAyVCU6WQsaMx2bjIi0ghw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Jan 2025 19:39:25 +0900
Received: from localhost.localdomain (unknown [10.226.93.251])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6CB13422D9D2;
	Wed, 15 Jan 2025 19:39:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-watchdog@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/5] watchdog: Make RZV2HWDT driver depend on ARCH_R9A09G47
Date: Wed, 15 Jan 2025 10:38:52 +0000
Message-ID: <20250115103858.104709-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/G3E watchdog timer IP is similar to the one found on RZ/V2H.
Add Kconfig dependency for RZV2HWDT driver with ARCH_R9A09G47 and
update the help description.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/watchdog/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f81705f8539a..646a84cc03e3 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -963,13 +963,14 @@ config RENESAS_RZG2LWDT
 	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
 
 config RENESAS_RZV2HWDT
-	tristate "Renesas RZ/V2H(P) WDT Watchdog"
-	depends on ARCH_R9A09G057 || COMPILE_TEST
+	tristate "Renesas RZ/{G3E,V2H(P)} WDT Watchdog"
+	depends on ARCH_R9A09G047 || ARCH_R9A09G057 || COMPILE_TEST
 	depends on PM || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-	  Renesas RZ/V2H(P) SoCs. These watchdogs can be used to reset a system.
+	  Renesas RZ/{G3E,V2H(P)} SoCs. These watchdogs can be used to reset a
+	  system.
 
 config ASPEED_WATCHDOG
 	tristate "Aspeed BMC watchdog support"
-- 
2.43.0


