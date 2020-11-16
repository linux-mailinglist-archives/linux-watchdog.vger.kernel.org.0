Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885C22B45CC
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Nov 2020 15:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730040AbgKPOZu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 16 Nov 2020 09:25:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729437AbgKPOZu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 16 Nov 2020 09:25:50 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4A4C0613CF;
        Mon, 16 Nov 2020 06:25:48 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id d18so6000473edt.7;
        Mon, 16 Nov 2020 06:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=L16V5nkbIF94gXRlKpA4q4FCXTH9WuIAPnoBpYHLXkU=;
        b=WeuEqUIQw/uCXjwMIr5thuv465m2Wy5JvfRHw1rQyoY6Qk/w0DVnsuI3e1YgYAV85T
         cyk7Wpj3FA/GhW72iZEsJZRgVRyJ7RivLX28BRGCS8yOQYAI1SDs+g8T607ZDRlZ7yXA
         GXKVT99aISzRxj6V9xu0kM8s+9FNsaNfzZ4A8EVnT2XiGoLROkyizYg7frZs4uzOw7Hj
         0NCCndfQY63iPYCq8/ctBiDn7k/GLRw318fKAqEMh6HVf/u8IIuq7pN4ihoBubNn1ABG
         lOm9Dr6XwzFECnzqpx77d0pwrG7af5WcMlYcvhxs8VrAhz5Cq2+/6gmhNYKxmii8ikLp
         Xv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=L16V5nkbIF94gXRlKpA4q4FCXTH9WuIAPnoBpYHLXkU=;
        b=iH3VWqXoFH0UgviF68rTp5IAV8HkdLiY1AL7BLnLOU2DI4XdeyKEnvsIjHyUQ2pyn0
         7peTYw5xrpNKskVpmGqAPWMEFG/dK4+ML6VQD5ij6cXZWk9Cj+c1jah0jZjfvXO9Vu2m
         TgyUcF2jt3/kuoCpIzblh1oGXZw6eF+X5fmlujiQVreWeMjcljGdSIfnndtX5vDMDkcF
         QpSAX8/FDl6c5rr6FywdulIJoy0hsCdyzuxKmQtMmlCG2CYDTJC9ODlPh9BRxfOgrkcf
         QN5D11DbWf7ayBBDY2pV9iR3ADDI6wLmEPHSsPPtWAwFAcyxrhodKHbj0TOk9IwCcLDz
         rF4Q==
X-Gm-Message-State: AOAM531YE37nnG0eaoCUVHmC3Gmz924gJzkoJIXvEuMGVLcu0u351pd7
        QrkbTmvT17hygF5Xa2E4+RbvwtdNHZIVtw==
X-Google-Smtp-Source: ABdhPJxBA/Rc8N9vzOogRluiecCDnqxK3aGFQpih53XK6vcBCS7S/v4+524mpSNCsYPMfP7Pdi984w==
X-Received: by 2002:a50:cd0a:: with SMTP id z10mr15509771edi.223.1605536747378;
        Mon, 16 Nov 2020 06:25:47 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id cn8sm10581825edb.18.2020.11.16.06.25.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2020 06:25:46 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-binding: watchdog: add Rockchip compatibles to snps,dw-wdt.yaml
Date:   Mon, 16 Nov 2020 15:25:39 +0100
Message-Id: <20201116142539.12377-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The Rockchip watchdog compatibles below are already in use,
but somehow never added to a document,
so add them to the snps,dw-wdt.yaml file.

"rockchip,rk3066-wdt", "snps,dw-wdt"
"rockchip,rk3188-wdt", "snps,dw-wdt"
"rockchip,rk3288-wdt", "snps,dw-wdt"
"rockchip,rk3368-wdt", "snps,dw-wdt"

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index d9fc7bb85..f7ee9229c 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -14,7 +14,15 @@ maintainers:
 
 properties:
   compatible:
-    const: snps,dw-wdt
+    oneOf:
+      - const: snps,dw-wdt
+      - items:
+          - enum:
+              - rockchip,rk3066-wdt
+              - rockchip,rk3188-wdt
+              - rockchip,rk3288-wdt
+              - rockchip,rk3368-wdt
+          - const: snps,dw-wdt
 
   reg:
     maxItems: 1
-- 
2.11.0

