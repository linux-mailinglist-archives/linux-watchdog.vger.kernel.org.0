Return-Path: <linux-watchdog+bounces-4882-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFqjJ0DvgWlAMwMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4882-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 13:51:12 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E53D9593
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 13:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A27F13149FBC
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 12:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AFB344DA1;
	Tue,  3 Feb 2026 12:43:18 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906EC1C69D;
	Tue,  3 Feb 2026 12:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122598; cv=none; b=t7l/ghASUdbIQ7SaHY8iiAkwa1V+MAdmrYldJ0+Ke+lBFlDGFcTHkftK4EtXgrPXrvtrA6PJg93QDaNKcc8baNn+YZVngqhkPjcIJ3ZaEr+ztgmFQtKOXT8q8KcI68NUIccl+YnQp5Ji+yP5IW1rNTtFTBemQvDnDuHhUy+LiIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122598; c=relaxed/simple;
	bh=5KB4s5v20dnYhByP6f+brbZkGfV7lqcvH3j1ABaoc0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCRFxbiQsEufQuPT7kEsCWpAOJ3+3MH/HO0hG9Hyn7pqyEOp6Yq5AzHizgzs9XrG0Mhiz7J1YUnwbIyrc6HKj/bXU0QCTFP0w6fDWyObLuloVaX+EOC+ZgTANhC5YhU10v9rczo2WHhy23FKYuHIVHscQIQQFwY7wAudhLIbB2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: WznixfsNTOagJuL5bPGPEA==
X-CSE-MsgGUID: 5hmqY40DRSuWPG2R/FaV0Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Feb 2026 21:43:09 +0900
Received: from mind-2s.example.org (unknown [10.226.36.118])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 555BF400F78B;
	Tue,  3 Feb 2026 21:43:04 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 3/3] clk: renesas: r9a09g057: Remove entries for WDT{0,2,3}
Date: Tue,  3 Feb 2026 12:42:47 +0000
Message-ID: <20260203124247.7320-4-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com>
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,glider.be,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4882-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.954];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-watchdog@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-watchdog,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 00E53D9593
X-Rspamd-Action: no action

The HW user manual for the Renesas RZ/V2H(P) SoC specifies
that only the WDT1 IP is supposed to be used by Linux,
while the WDT{0,2,3} IPs are supposed to be used by the CM33
and CR8 cores.

Remove the clock and reset entries for WDT{0,2,3} to prevent
interfering with the CM33 and CR8 cores.

This change is harmless as only WDT1 is used by Linux, there
are no users for the WDT{0,2,3} cores.

Fixes: 3aeccbe08171 ("clk: renesas: r9a09g057: Add clock and reset entries for GTM/RIIC/SDHI/WDT")
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

---
v1->v2:
* No change.

 drivers/clk/renesas/r9a09g057-cpg.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 6943cad318b5..07803e0c91de 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -280,22 +280,10 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(11, BIT(15))),
 	DEF_MOD("gtm_7_pclk",			CLK_PLLCLN_DIV16, 4, 10, 2, 10,
 						BUS_MSTOP(12, BIT(0))),
-	DEF_MOD("wdt_0_clkp",			CLK_PLLCM33_DIV16, 4, 11, 2, 11,
-						BUS_MSTOP(3, BIT(10))),
-	DEF_MOD("wdt_0_clk_loco",		CLK_QEXTAL, 4, 12, 2, 12,
-						BUS_MSTOP(3, BIT(10))),
 	DEF_MOD("wdt_1_clkp",			CLK_PLLCLN_DIV16, 4, 13, 2, 13,
 						BUS_MSTOP(1, BIT(0))),
 	DEF_MOD("wdt_1_clk_loco",		CLK_QEXTAL, 4, 14, 2, 14,
 						BUS_MSTOP(1, BIT(0))),
-	DEF_MOD("wdt_2_clkp",			CLK_PLLCLN_DIV16, 4, 15, 2, 15,
-						BUS_MSTOP(5, BIT(12))),
-	DEF_MOD("wdt_2_clk_loco",		CLK_QEXTAL, 5, 0, 2, 16,
-						BUS_MSTOP(5, BIT(12))),
-	DEF_MOD("wdt_3_clkp",			CLK_PLLCLN_DIV16, 5, 1, 2, 17,
-						BUS_MSTOP(5, BIT(13))),
-	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18,
-						BUS_MSTOP(5, BIT(13))),
 	DEF_MOD("rsci0_pclk",			CLK_PLLCLN_DIV16, 5, 13, 2, 29,
 						BUS_MSTOP(11, BIT(3))),
 	DEF_MOD("rsci0_tclk",			CLK_PLLCLN_DIV16, 5, 14, 2, 30,
@@ -598,10 +586,7 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(7, 2, 3, 3),		/* GTM_5_PRESETZ */
 	DEF_RST(7, 3, 3, 4),		/* GTM_6_PRESETZ */
 	DEF_RST(7, 4, 3, 5),		/* GTM_7_PRESETZ */
-	DEF_RST(7, 5, 3, 6),		/* WDT_0_RESET */
 	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
-	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
-	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
 	DEF_RST(8, 1, 3, 18),		/* RSCI0_PRESETN */
 	DEF_RST(8, 2, 3, 19),		/* RSCI0_TRESETN */
 	DEF_RST(8, 3, 3, 20),		/* RSCI1_PRESETN */
-- 
2.34.1


