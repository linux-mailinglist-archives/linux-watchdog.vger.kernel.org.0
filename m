Return-Path: <linux-watchdog+bounces-100-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEE9801E3D
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Dec 2023 20:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B09191C20866
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 Dec 2023 19:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDDC20DD6;
	Sat,  2 Dec 2023 19:25:58 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 98882124;
	Sat,  2 Dec 2023 11:25:54 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,246,1695654000"; 
   d="scan'208";a="185089877"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Dec 2023 04:25:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.28])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id DBB1C40764EE;
	Sun,  3 Dec 2023 04:25:49 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 01/11] dt-bindings: watchdog: dlg,da9062-watchdog: Add fallback for DA9061 watchdog
Date: Sat,  2 Dec 2023 19:25:25 +0000
Message-Id: <20231202192536.266885-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
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
v2:
 * New patch
---
 .../bindings/watchdog/dlg,da9062-watchdog.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
index f058628bb632..2b71fdb9251c 100644
--- a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
+++ b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
@@ -14,9 +14,14 @@ allOf:
 
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
+          - enum:
+              - dlg,da9061-watchdog
+          - const: dlg,da9062-watchdog # da9062-watchdog fallback
 
   dlg,use-sw-pm:
     type: boolean
-- 
2.39.2


