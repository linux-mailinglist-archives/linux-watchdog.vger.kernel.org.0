Return-Path: <linux-watchdog+bounces-120-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86390803B66
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Dec 2023 18:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6EFCB20A98
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Dec 2023 17:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCED2E826;
	Mon,  4 Dec 2023 17:25:31 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A32783;
	Mon,  4 Dec 2023 09:25:27 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,250,1695654000"; 
   d="scan'208";a="185273253"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Dec 2023 02:25:27 +0900
Received: from localhost.localdomain (unknown [10.226.93.142])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 27DD64031BEB;
	Tue,  5 Dec 2023 02:25:22 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3.1 2/8] dt-bindings: watchdog: dlg,da9062-watchdog: Add fallback for DA9061 watchdog
Date: Mon,  4 Dec 2023 17:25:04 +0000
Message-Id: <20231204172510.35041-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DA9061 watchdog is identical to DA9062 watchdog, so no driver changes
are required. The fallback compatible string "dlg,da9062-watchdog" will be
used on DA9061 watchdog.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v3.1:
 * Dropped comment for d9061 watchdog fallback.
 * Replaced enum->const for dlg,da9061-watchdog and its fallback.
v2->v3:
 * No change
v2:
 * New patch
---
 .../bindings/watchdog/dlg,da9062-watchdog.yaml         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
index f058628bb632..7c63b99dac85 100644
--- a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
+++ b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
@@ -14,9 +14,13 @@ allOf:
 
 properties:
   compatible:
-    enum: 
-      - dlg,da9061-watchdog
-      - dlg,da9062-watchdog
+    oneOf:
+      - items:
+          - enum:
+              - dlg,da9062-watchdog
+      - items:
+          - const: dlg,da9061-watchdog
+          - const: dlg,da9062-watchdog
 
   dlg,use-sw-pm:
     type: boolean
-- 
2.39.2


