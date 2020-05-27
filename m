Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152BF1E4A28
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 May 2020 18:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391174AbgE0Q3l (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 May 2020 12:29:41 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:10710 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387775AbgE0Q3k (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 May 2020 12:29:40 -0400
X-IronPort-AV: E=Sophos;i="5.73,441,1583161200"; 
   d="scan'208";a="48165992"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 May 2020 01:29:39 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 976664017F4D;
        Thu, 28 May 2020 01:29:37 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] dt-bindings: watchdog: renesas,wdt: Document r8a7742 support
Date:   Wed, 27 May 2020 17:29:27 +0100
Message-Id: <1590596967-22973-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

RZ/G1H (R8A7742) watchdog implementation is compatible with R-Car Gen2,
therefore add relevant documentation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Hi,

This patch is part of series [1], as requested by Rob [1] I have
reabsed my changes on-top json-schema conversion patch.

[1] https://www.spinics.net/lists/netdev/msg653258.html
[2] https://patchwork.kernel.org/patch/11552335/

Cheers,
Prabhakar
---
 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 27e8c4a..572f4c9 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -24,6 +24,7 @@ properties:
 
       - items:
           - enum:
+              - renesas,r8a7742-wdt      # RZ/G1H
               - renesas,r8a7743-wdt      # RZ/G1M
               - renesas,r8a7744-wdt      # RZ/G1N
               - renesas,r8a7745-wdt      # RZ/G1E
-- 
2.7.4

