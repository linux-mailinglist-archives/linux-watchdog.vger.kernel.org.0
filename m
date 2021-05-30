Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D957395044
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 May 2021 11:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbhE3J22 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 May 2021 05:28:28 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:43165 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbhE3J20 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 May 2021 05:28:26 -0400
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N3sNa-1lMzR23wKu-00zklA; Sun, 30 May 2021 11:26:25 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 4/6] dt-bindings: arm: bcm2835: Add Raspberry Pi 400 to DT schema
Date:   Sun, 30 May 2021 11:26:13 +0200
Message-Id: <1622366775-5309-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:iSxQJiv4EPLM741bFXFPcUmIZnM+ASxBr4E+FP5KuGtjpH+hqah
 XbWC/P/lcTRRPyQVYwbQ0u6THdF6G2ZlnqM4nP3y9c8KxtSeXV/SM7w4VM3GeonQ4XPF54O
 +xwOcgIotAG+c6Uvpg55YytS6vYczvVNAdcvBdsrW5wakA/5CcDp1cul0GbIDGhjP4NF4AC
 ew7QXH7oitTkXoRpJFB5Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MbSo70PsCNo=:l/cfdKz+N1MWPf3ciTZN1s
 22sODCcGviGqCd3udm64FjkGV0fIQGo++TkEA8X6vB/Js52V9nqCDARM5C/vQyMARR7pT8elc
 MNYT2T+nDEAIysRdzwoDbCP9kAjlMvfVy0iiEj3YmkapJDtvI8sLNxIk8kljd2+fZMbvq2JOk
 cVyMEAWuwuFj/O+ZtphLsSa6NjvKtUdddOEWoDq5c+wJakYKvb5siPzuuPf7jQExM5hkhIy3G
 yK40QWOcxSmN2s+XP/HKbOZnEStgWPimbdn5Dpu/vYjT7cdxiCCIAdL2AJb4J7XFJ4dFiEyP1
 dSlekKoVxXBkimNgGld/NM7tjULvYWzjDFfAPxuhFvJzwKgUiGuwT1K/A7RPAniwaKyDfQvmQ
 Ly4xePMJUyFSdqSX8T7ud8AevNL0ZQSNWeZ9NNlQxTk0J+DofMIGD6izN/+7CZd0V9NOpsmW5
 J6uxMnRSQ0PBzOCRuIm2nFKh5+/UQnl34j7qun1nsHcWQeZWBzvK2GLeEw/rlaz9pPsPx/buh
 lLKHiFggBIsW3dWUWECOSM=
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add new Raspberry Pi 400 to DT schema.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 812ae8c..230b80d 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -18,6 +18,7 @@ properties:
       - description: BCM2711 based Boards
         items:
           - enum:
+              - raspberrypi,400
               - raspberrypi,4-model-b
           - const: brcm,bcm2711
 
-- 
2.7.4

