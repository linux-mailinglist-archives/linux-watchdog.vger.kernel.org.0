Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C394440E35
	for <lists+linux-watchdog@lfdr.de>; Sun, 31 Oct 2021 13:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbhJaMYy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 31 Oct 2021 08:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbhJaMYw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 31 Oct 2021 08:24:52 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23800C061714
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:21 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z20so55284763edc.13
        for <linux-watchdog@vger.kernel.org>; Sun, 31 Oct 2021 05:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YrX17JLN3iZK9elmHvVA7fpxdjI/sdFhycMWQkjxxmg=;
        b=EoJorhiELL6i8YX9P+3PygS5UCUPug1ARREUj9jNmgGMuJ+8cio7Zc3HRIdeQEveTz
         swQRHS1aFNJ+72CRMI1zdgXUe2ds+ldsMQRUBhO3dlShrcmTWOG+3Gcjq3z0EC/zydGw
         VimMqtPezFOWur3Ysv6cc5+/m6TkT+Rqot13TMNA3oOsb51G7+myt48d3LoUZ+lvV1DI
         TmRJsrg9kWimfBRRvzzpSbSwBgF2+m8XdkQAcBRNjyAJIYjPo5Jbm5uwhHlRrjGeTS3o
         cZlOTCMUC2mCQTUxnN/q9DO8yqkaMaI/StRj7xwUC5EqLo2r3SxqGxcUjk+bgNlriJdo
         7RkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YrX17JLN3iZK9elmHvVA7fpxdjI/sdFhycMWQkjxxmg=;
        b=mAbDZdI75Q5P6o85bH8AgStThnEtp8zjAft5WHt4gkWu/Dbez7f7A6dzb14KbuFmH9
         nyj6yZgIOoIT38U5k2McC772hrxLYwIYbKgpcQ8nNyyHqqXZ9s5rWemzXhdyq8FYktNt
         lI70IGxfSpfXklmaKHxL3dXFr6+m4gYMNDoDBl79lHxkNEsOK+ulnzxKQpUce6lB3Cn0
         G5YlaHa1s/KYkiVINaherWtOEKZtzve0Ytac2infB++mYPnX0rruKbmW6JtoMqUlpE50
         3+9FoXuxuL0lzsyfgk9HkE+L8vEk7S80BGnhXK83SjZm1qDTVm7xU4dFVayY/2YcqTq3
         BfiQ==
X-Gm-Message-State: AOAM5308Lf9/s7RfcBt3JgkT0VnEJQM7nIeZZSb3PjDuzY6BhVpoRP7A
        xGEqLOXhOmsJO1PllQ8MoDbfIg==
X-Google-Smtp-Source: ABdhPJxuGF6wQckRdjEtPpGPkF2sf452nvOubT7XXExNKWVcsdUQCtuxKqSxcFUKSExu8kZCUIhqSg==
X-Received: by 2002:a17:907:86a1:: with SMTP id qa33mr28216618ejc.270.1635682939671;
        Sun, 31 Oct 2021 05:22:19 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id ga1sm5738052ejc.40.2021.10.31.05.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:22:19 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 01/12] dt-bindings: watchdog: Require samsung,syscon-phandle for Exynos7
Date:   Sun, 31 Oct 2021 14:22:05 +0200
Message-Id: <20211031122216.30212-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211031122216.30212-1-semen.protsenko@linaro.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Exynos7 watchdog driver is clearly indicating that its dts node must
define syscon phandle property. That was probably forgotten, so add it.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Fixes: 2b9366b66967 ("watchdog: s3c2410_wdt: Add support for Watchdog device on Exynos7")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Added "Fixes" tag

 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 76cb9586ee00..93cd77a6e92c 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -39,8 +39,8 @@ properties:
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-      Phandle to the PMU system controller node (in case of Exynos5250
-      and Exynos5420).
+      Phandle to the PMU system controller node (in case of Exynos5250,
+      Exynos5420 and Exynos7).
 
 required:
   - compatible
@@ -58,6 +58,7 @@ allOf:
             enum:
               - samsung,exynos5250-wdt
               - samsung,exynos5420-wdt
+              - samsung,exynos7-wdt
     then:
       required:
         - samsung,syscon-phandle
-- 
2.30.2

