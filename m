Return-Path: <linux-watchdog+bounces-2769-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7294A1C7F2
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 14:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 053EE1884B37
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 13:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7053586324;
	Sun, 26 Jan 2025 13:27:03 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C330EEDE;
	Sun, 26 Jan 2025 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737898023; cv=none; b=T4VMWQmK9zXhHfjrgDNhzLIrwEmtOX+We2EP4fE7+hm/FUDk1SyQkdvMVJszAngNXdXQ40+TBjergC9HoAe8ZXmTMlSmg22y8UqjtMoI2CchAfGiSREfoBpN3AYJYl/kqi5WQawRht10TFEVDGz8NkkXSB75WPNFqmc25qpr2J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737898023; c=relaxed/simple;
	bh=eb3bkPKmLo+3SX217IeGx8usT///U6RM9vLoNEEHSY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U2GoizEbX+r6oRk0oxAQ6wuiAodHKzR5Yu68v+oNvMeToNmUoHmmNBRZPYJztM6Ty+1T+7xXg3OcCj0QIPae1QHSbB6fTxUbUv1Z9VmoeqvXm7I/VfzrcA64DOkFdnAYNLYcM7AyjVIWeLIi3p3eb38vKDQ0OawTbV/dyFoWEoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: qCdURsCNQTSYFzop/N6gHA==
X-CSE-MsgGUID: hojqy+r/RQ6ImM/yB1b0eg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jan 2025 22:26:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.41])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3286240062A0;
	Sun, 26 Jan 2025 22:26:36 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Add support for RZ/G3E WDT
Date: Sun, 26 Jan 2025 13:26:29 +0000
Message-ID: <20250126132633.31956-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RZ/G3E WDT IP is similar to RZ/V2H WDT. WDT0 can be used for CM33 cold
reset, system reset and asserting WDTUDFCM pin where as WDT1 can be used
for CA55 cold reset, system reset and asserting WDTUDFCA pin. Other 2
watchdogs can be used for system reset. So define WDT{1..3} in SoC dtsi.

v1->v2:
 * Dropped patch#2, #4 and #5 as it is queued for renesas_clk and
   renesas_devel.
 * Collected tags for patch#1.
 * Updated commit header and description for patch#2.
 * Replaced ARCH_R9A09G047->ARCH_RENESAS as both RZ/V2H and RZ/G3E belongs
   to ARCH_RENESAS family.

Biju Das (2):
  dt-bindings: watchdog: renesas,wdt: Document RZ/G3E support
  watchdog: Enable RZV2HWDT driver depend on ARCH_RENESAS

 .../devicetree/bindings/watchdog/renesas,wdt.yaml          | 4 ++++
 drivers/watchdog/Kconfig                                   | 7 ++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.43.0


