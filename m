Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35F9C1141E8
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Dec 2019 14:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbfLENrz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Dec 2019 08:47:55 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:51484 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729578AbfLENrz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Dec 2019 08:47:55 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id aDns2100D5USYZQ06DnsAz; Thu, 05 Dec 2019 14:47:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrU0-0002E6-A6; Thu, 05 Dec 2019 14:47:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrU0-0001oT-9I; Thu, 05 Dec 2019 14:47:52 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: watchdog: renesas-wdt: Document r8a77961 support
Date:   Thu,  5 Dec 2019 14:47:51 +0100
Message-Id: <20191205134751.6928-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Document support for the Watchdog Timer in the Renesas R-Car M3-W+
(R8A77961) SoC.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/watchdog/renesas,wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt b/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
index a5bf04dba410aced..79b3c62f183d26dc 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
@@ -19,6 +19,7 @@ Required properties:
 	         - "renesas,r8a7794-wdt" (R-Car E2)
 	         - "renesas,r8a7795-wdt" (R-Car H3)
 	         - "renesas,r8a7796-wdt" (R-Car M3-W)
+	         - "renesas,r8a77961-wdt" (R-Car M3-W+)
 		 - "renesas,r8a77965-wdt" (R-Car M3-N)
 	         - "renesas,r8a77970-wdt" (R-Car V3M)
 	         - "renesas,r8a77990-wdt" (R-Car E3)
-- 
2.17.1

