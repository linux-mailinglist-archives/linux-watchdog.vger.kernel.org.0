Return-Path: <linux-watchdog+bounces-4851-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH4mD8tpe2lEEgIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4851-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 15:08:11 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA83B0B54
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 15:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9404830327EE
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 14:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A9137F0EE;
	Thu, 29 Jan 2026 14:07:47 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B824C3081BE;
	Thu, 29 Jan 2026 14:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769695667; cv=none; b=Z5zztUGxxFhSjZguurApiOfWfp87LN56ZtjuDOXS47Cvij67HurMzZiGdMpvYgBsYn7Jxn4diNM7q51qUxkd+BDZ9kqteRDvKqAoXi6YH4Ar3Gy/HtxYrsXTIo4tjNdxlfnnu+bvKPGdvBx3fiXN8YEu4YOMEX7uP6s5/N8+Iw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769695667; c=relaxed/simple;
	bh=F0/0TKdZkKqb5Oyebd4MS1zhGU3g/uK2f0oKQUluPms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TsHYC9kNAc1NkXrDYWuGqtlKbdrqcI4iXN2PrTDJdInKRDPUD73yFG6xwcOJdOI+WJKNjXFQB9mfr8/KIGjy2hVP/MRMgGOd+nt38bkd6FzZJOt/Qssx8ZZtgX4lXeoAuM1UoYbzjGEMSNI3/AjagBH1nMfGwBtsCBEpKnFqmlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: IayODn3MTt6GnTtV6kLQHg==
X-CSE-MsgGUID: wbxPYxZ/SZy9E5xCX8MGIg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Jan 2026 23:07:43 +0900
Received: from mind-2s.example.org (unknown [10.226.36.118])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5382641AE669;
	Thu, 29 Jan 2026 23:07:38 +0900 (JST)
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH mainline-linux 1/3] dt-bindings: watchdog: renesas,r9a09g057-wdt: Rework example
Date: Thu, 29 Jan 2026 14:07:29 +0000
Message-ID: <20260129140731.12633-2-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129140731.12633-1-fabrizio.castro.jz@renesas.com>
References: <20260129140731.12633-1-fabrizio.castro.jz@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4851-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.219.186.0:email];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-watchdog@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DBA83B0B54
X-Rspamd-Action: no action

When the bindings for the Renesas RZ/V2H(P) SoC were factored
out IP WDT0 was selected for the example, however the HW user
manual states that only IP WDT1 can be used by Linux.

This commit is part of a series that removes WDT{0,2,3} support
from the kernel, therefore the example from the bindings has
lost its meaning.

Update the example accordingly.

Fixes: fcba2855251f ("dt-bindings: watchdog: factor out RZ/V2H(P) watchdog")
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 .../bindings/watchdog/renesas,r9a09g057-wdt.yaml          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
index 099200c4f136..975c5aa4d747 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
@@ -89,11 +89,11 @@ examples:
   - |
     #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
 
-    watchdog@11c00400 {
+    watchdog@14400000 {
             compatible = "renesas,r9a09g057-wdt";
-            reg = <0x11c00400 0x400>;
-            clocks = <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4c>;
+            reg = <0x14400000 0x400>;
+            clocks = <&cpg CPG_MOD 0x4d>, <&cpg CPG_MOD 0x4e>;
             clock-names = "pclk", "oscclk";
-            resets = <&cpg 0x75>;
+            resets = <&cpg 0x76>;
             power-domains = <&cpg>;
     };
-- 
2.34.1


