Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D148367792
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Apr 2021 04:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234258AbhDVCqV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Apr 2021 22:46:21 -0400
Received: from mail-m121145.qiye.163.com ([115.236.121.145]:43256 "EHLO
        mail-m121145.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhDVCqV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Apr 2021 22:46:21 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
        by mail-m121145.qiye.163.com (Hmail) with ESMTPA id EF26180012E;
        Thu, 22 Apr 2021 10:45:44 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH V6 2/2] doc: mtk-wdt: support pre-timeout when the bark irq is available
Date:   Thu, 22 Apr 2021 10:45:32 +0800
Message-Id: <1619059532-17805-3-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619059532-17805-1-git-send-email-wangqing@vivo.com>
References: <1619059532-17805-1-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGkNDS1ZMHRoYTR5JTBofGU1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSI6Mio5Sj8NPA8aMFFNFSoy
        CipPCy9VSlVKTUpCS05CTk9OTElLVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISVlXWQgBWUFJSkhINwY+
X-HM-Tid: 0a78f77814f4b03akuuuef26180012e
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add description of pre-timeout in mtk-wdt.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index e36ba60..ae57d6c
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -1,5 +1,8 @@
 Mediatek SoCs Watchdog timer
 
+The watchdog supports a pre-timeout interrupt that fires timeout-sec/2
+before the expiry.
+
 Required properties:
 
 - compatible should contain:
-- 
2.7.4

