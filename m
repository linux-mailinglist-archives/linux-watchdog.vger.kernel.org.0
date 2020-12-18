Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E380B2DE257
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Dec 2020 13:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgLRMG1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Dec 2020 07:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726517AbgLRMG1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Dec 2020 07:06:27 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018C8C06138C;
        Fri, 18 Dec 2020 04:05:47 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id 6so2864897ejz.5;
        Fri, 18 Dec 2020 04:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=df3IfnfXrm4i2RajA08Sg4cjB+rbAYObLY7D8ABk32s=;
        b=BfBK4dg6bgst+3YtQSqFkSDaFBbrXIMFOJ7wgIptM74ngk8HU9H0CEKAoYpt5vSymX
         PjSkbpg3AYqSayRAui5b8rxhNMoNKGmC/fVe63AlOVxhdVTVwTsElVrEcDowTEv3jWOH
         msw0O4gCFjXaRaM4lScrIYGFIcXLZPdLSiTByijqEM9mCk42VUwE+7rP451p5gxAuJmZ
         0bTfCCvniv2rWhEzUy9BFdbXRj/wLetGnByd/Sz65EpvNbJGDByQE8EM9r1bjuGlIdfU
         3WNmuLNSbq4c6KSATu5VB26QnpsJRUAQY/U/fXeTsOELVEEMzKgSR28EZCM+SUS0AIR0
         4rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=df3IfnfXrm4i2RajA08Sg4cjB+rbAYObLY7D8ABk32s=;
        b=jfgWIgeikFwfRBFcT4u6FxQroLnb2WEGQMLhznKyAQ6oJuGDdShuL828/9upR+J4mQ
         7XIwemuirqcEdY4Y4fVffShmktrE4JrB9ogjRltqlN9+IBnwV3yDCATwwMXaM88QYVtG
         uOooEMHMznTRrgxtzzXBlPgDMgfZ27obSQl8hSGLNOrpn5gu6x1ItH7HYJ2wCTLy7/+Q
         DxRGIfmM4xeISd20MqDQK0goG426bboL40KFGVbVsAV4ZNUtWfmNg3iVvCUE1gHLR6vM
         QY5pGM5bA8XGoHwhVHFz3ejrtUprChsZNMGNSslpy2fVDl0T9mMR9eZWZFNb9NrwmN0P
         exhg==
X-Gm-Message-State: AOAM530WNxEVolaERB5xrJfes0UVbWdEjhXUcy12+2baS83+Vcm9JwiN
        38mJ9UFCZ4M9p5Tzo9g6pWs=
X-Google-Smtp-Source: ABdhPJyKw1nhb3temxyQ33TJyRuTbXGlUWp6OlKcoXlUygUCrobAmOrKQUBUJCyln+ziWqp+d7uW0Q==
X-Received: by 2002:a17:906:1498:: with SMTP id x24mr3598798ejc.170.1608293145634;
        Fri, 18 Dec 2020 04:05:45 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id ga37sm4775832ejc.96.2020.12.18.04.05.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Dec 2020 04:05:44 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 1/8] dt-binding: watchdog: add more Rockchip compatibles to snps,dw-wdt.yaml
Date:   Fri, 18 Dec 2020 13:05:27 +0100
Message-Id: <20201218120534.13788-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog compatible strings are suppose to be SoC orientated.
In the more recently added Rockchip SoC dtsi files only
the fallback string "snps,dw-wdt" is used, so add the following
compatible strings:

"rockchip,px30-wdt", "snps,dw-wdt"
"rockchip,rk3228-wdt", "snps,dw-wdt"
"rockchip,rk3308-wdt", "snps,dw-wdt"
"rockchip,rk3328-wdt", "snps,dw-wdt"
"rockchip,rk3399-wdt", "snps,dw-wdt"
"rockchip,rv1108-wdt", "snps,dw-wdt"

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index f7ee9229c..b58596b18 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -18,10 +18,16 @@ properties:
       - const: snps,dw-wdt
       - items:
           - enum:
+              - rockchip,px30-wdt
               - rockchip,rk3066-wdt
               - rockchip,rk3188-wdt
+              - rockchip,rk3228-wdt
               - rockchip,rk3288-wdt
+              - rockchip,rk3308-wdt
+              - rockchip,rk3328-wdt
               - rockchip,rk3368-wdt
+              - rockchip,rk3399-wdt
+              - rockchip,rv1108-wdt
           - const: snps,dw-wdt
 
   reg:
-- 
2.11.0

