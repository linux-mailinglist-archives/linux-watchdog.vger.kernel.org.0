Return-Path: <linux-watchdog+bounces-2770-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA9BA1C7F4
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 14:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50DDB165717
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 13:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29996137930;
	Sun, 26 Jan 2025 13:27:06 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE85EEDE;
	Sun, 26 Jan 2025 13:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737898026; cv=none; b=QJuGQ+JHOJtbiIGZvUsFOUIvubHXl5rQiEIS0Y5ohUl4iEkWuoicM310Hm7YF5Y2Q5q2nDHUXrY6UoVb91CcFKfeBNDGw0wtfW1oL9VmyZHPDRhm/p0PF+2ayJ7mbk/jO0ZGs9FneW1Tmvg1ZjVIONBq0A+qHxNyj9pZXEEwPp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737898026; c=relaxed/simple;
	bh=A49auCRqa4hmokxzU6pxxyRoGK3JDcCQz2icPYRYYs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2sWpVXBz7lB5akpV5xm7lj+lCukcSo71o9RTTB3pC5I6fee2BSbalybmLwv1n+7qXW618vDYp9EoYRFUPkJhmSC6xOJjGOgpo/GqED/i2+4wBIQHIPXhfBEVhW4D2T7Jm/Aq2n8RqbEsoAgl/Xn5y6zZUSHfCoIVkBsbHb4830=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: wxKeMQd7Tr6rBcykgCqeXg==
X-CSE-MsgGUID: IHSIOgwNRveCg/ahDP5QEA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jan 2025 22:26:58 +0900
Received: from localhost.localdomain (unknown [10.226.92.41])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E661E40065A4;
	Sun, 26 Jan 2025 22:26:46 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-watchdog@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] watchdog: Enable RZV2HWDT driver depend on ARCH_RENESAS
Date: Sun, 26 Jan 2025 13:26:31 +0000
Message-ID: <20250126132633.31956-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250126132633.31956-1-biju.das.jz@bp.renesas.com>
References: <20250126132633.31956-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/G3E watchdog timer IP is similar to the one found on RZ/V2H. Both these
SoCs belong to the ARCH_RENESAS family. So, it makes sense to use
ARCH_RENESAS rather than ARCH_R9A09G057 to enable the RZV2HWDT driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit header and description.
 * Replaced ARCH_R9A09G047->ARCH_RENESAS as both RZ/V2H and RZ/G3E belongs
   to ARCH_RENESAS family.
---
 drivers/watchdog/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f81705f8539a..b9d23f98a436 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -963,13 +963,14 @@ config RENESAS_RZG2LWDT
 	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
 
 config RENESAS_RZV2HWDT
-	tristate "Renesas RZ/V2H(P) WDT Watchdog"
-	depends on ARCH_R9A09G057 || COMPILE_TEST
+	tristate "Renesas RZ/{G3E,V2H(P)} WDT Watchdog"
+	depends on ARCH_RENESAS || COMPILE_TEST
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


