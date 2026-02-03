Return-Path: <linux-watchdog+bounces-4881-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHi+Ob/ugWlAMwMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4881-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 13:49:03 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B796D94D9
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 13:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B83AF314569B
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 12:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D575F346787;
	Tue,  3 Feb 2026 12:43:09 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8158A346777;
	Tue,  3 Feb 2026 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122589; cv=none; b=tF18QfJM+KsqZ8AJW/3s5v0CTPTD4yVn/AOO+CM56FlQMFPW35yzlw8ea+5Ij0nuLAISlUeBSfcYpgKab4yxsCiRcOjT7l0LvG1Ttmj4jVhjCpuwhoriBEfFoxm6PLFbDhncN/pngiMQo57iVymhFqY7fn4zi2eVUpzzuRlZpZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122589; c=relaxed/simple;
	bh=5bX7wrIWf/xJkRhW09duvPVbKy38n0Uz8+BAuS02c5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVYiYtfv2xhvFAwDdT2lOIB+1nB8uMViaLVcxzmA7rQ6ufEFPJfeXL7NHS3RrirRXg+yFUNKDzhOPOYhByYtONNUqPM73+zAEPDCIojVrKnqe/pZZ18qo2wSuM17uUusCIuerl7Fh5HaysDkNza0BY9T6pUJisV3jPpzwaIz5w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: n4Y1FAuJRLeAtyEOjm157A==
X-CSE-MsgGUID: 0idDbr/tQzeND+6zcKfbXA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Feb 2026 21:43:03 +0900
Received: from mind-2s.example.org (unknown [10.226.36.118])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1B203400F78B;
	Tue,  3 Feb 2026 21:42:58 +0900 (JST)
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
Subject: [PATCH v2 2/3] arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3} nodes
Date: Tue,  3 Feb 2026 12:42:46 +0000
Message-ID: <20260203124247.7320-3-fabrizio.castro.jz@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,glider.be,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4881-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.954];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-watchdog@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-watchdog,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[11c00800:email,renesas.com:mid,renesas.com:email,0.198.93.64:email,11c00400:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.219.186.0:email,0.198.94.208:email]
X-Rspamd-Queue-Id: 4B796D94D9
X-Rspamd-Action: no action

The HW user manual for the Renesas RZ/V2H(P) SoC (a.k.a r9a09g057)
states that only WDT1 is supposed to be accessed by the CA55 cores.
WDT0 is supposed to be used by the CM33 core, WDT2 is supposed
to be used by the CR8 core 0, and WDT3 is supposed to be used
by the CR8 core 1.

Remove wdt{0,2,3} from the SoC specific device tree to make it
compliant with the specification from the HW manual.

This change is harmless as there are currently no users of the
wdt{0,2,3} device tree nodes, only the wdt1 node is actually used.

Fixes: 095105496e7d ("arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes")
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

---
v1->v2:
* No change.

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 30 ----------------------
 1 file changed, 30 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 80cba9fcfe7b..504c28386622 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -581,16 +581,6 @@ ostm7: timer@12c03000 {
 			status = "disabled";
 		};
 
-		wdt0: watchdog@11c00400 {
-			compatible = "renesas,r9a09g057-wdt";
-			reg = <0 0x11c00400 0 0x400>;
-			clocks = <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4c>;
-			clock-names = "pclk", "oscclk";
-			resets = <&cpg 0x75>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
-
 		wdt1: watchdog@14400000 {
 			compatible = "renesas,r9a09g057-wdt";
 			reg = <0 0x14400000 0 0x400>;
@@ -601,26 +591,6 @@ wdt1: watchdog@14400000 {
 			status = "disabled";
 		};
 
-		wdt2: watchdog@13000000 {
-			compatible = "renesas,r9a09g057-wdt";
-			reg = <0 0x13000000 0 0x400>;
-			clocks = <&cpg CPG_MOD 0x4f>, <&cpg CPG_MOD 0x50>;
-			clock-names = "pclk", "oscclk";
-			resets = <&cpg 0x77>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
-
-		wdt3: watchdog@13000400 {
-			compatible = "renesas,r9a09g057-wdt";
-			reg = <0 0x13000400 0 0x400>;
-			clocks = <&cpg CPG_MOD 0x51>, <&cpg CPG_MOD 0x52>;
-			clock-names = "pclk", "oscclk";
-			resets = <&cpg 0x78>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
-
 		rtc: rtc@11c00800 {
 			compatible = "renesas,r9a09g057-rtca3", "renesas,rz-rtca3";
 			reg = <0 0x11c00800 0 0x400>;
-- 
2.34.1


