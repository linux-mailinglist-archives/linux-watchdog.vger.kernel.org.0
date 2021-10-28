Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA56F43E86C
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Oct 2021 20:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhJ1SiA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 Oct 2021 14:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhJ1Sh7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 Oct 2021 14:37:59 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79D5C061745
        for <linux-watchdog@vger.kernel.org>; Thu, 28 Oct 2021 11:35:31 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 188so12310766ljj.4
        for <linux-watchdog@vger.kernel.org>; Thu, 28 Oct 2021 11:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0h9MI5+nWpL7nv3kn46aEjYMVGjl4934m5PO+DJKiLI=;
        b=MKEq0geXa1eT2tQFBS/WYl3gwCPfOmg2L0DmJjAS75wUxFQaLny2BqlgQqgc67JX8T
         1eU7Wo7elUOYI5w08gD3ujyLzYlT74MOXokrkpIJa3HLZiW8cVqXWM5wNjU2lfLhkLoI
         TIKI3YVP4DAws7hoQGvLzFOJqLhnG+mGZKyrMxjOt2lddr1jFBEIhgnXREPdMIDT+T31
         verhiIhT6LNatzJB3wZGR/qostXudLyIli6eDJiV0Fx6Q8yxhqKjjeDGQRt0C8169sdQ
         UbzsDpDwLlZt2GoI3GEuLPz4Tb+qDIrJsNkcK6Q0LHC8HEjEzaAXwPJrcC9w34NYfJhK
         2U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0h9MI5+nWpL7nv3kn46aEjYMVGjl4934m5PO+DJKiLI=;
        b=OTkBHyTwPqXPXCPUVTlSnMVmsNNYZgste4gC/gpsS5vFfef0F9MPeq0P+q1Pwr4Mry
         amtzuotxn32joOO2qs3vPZ1iDdaOZjwGVBbY9bKGx1jAIqbAY9cXBSZUnaUmR9IhSUmZ
         2qHAnl6q0uT5WdIFLCAX+6V3nUT2QGYsbFuNpun/8M3GDbgUk+XxtHZQqpHzwfn1nFBD
         Y1pXO3CEN1uell/us/7Wl5D2/DN9GWyiwLho0gvUNlN8LkCxb/GB+nlDWvgqw5HjeXFI
         SuVh/LqwZyOnTJAZg7CR4ods6uo0gnmNee1GGV9mTpLkSYZWeyolcnHTWXDLQCWEQQNG
         3F/g==
X-Gm-Message-State: AOAM53245btwyJrbK/pEpKTGPiqhzjGn4kt6pMaCo+7dXj7IIkJ4sFrP
        jfVlxQ00x4XP2El2vtd82KNeqw==
X-Google-Smtp-Source: ABdhPJwxy/T1TXHAOSTfUZChLQnwHDSBgFoC2mGqdGsqWUdVRmYvf9KqsTRArBLOPGpZRJYiCdK+lQ==
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr6597055ljn.497.1635446130085;
        Thu, 28 Oct 2021 11:35:30 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id r127sm389488lff.62.2021.10.28.11.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:35:29 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: watchdog: Require samsung,syscon-phandle for Exynos7
Date:   Thu, 28 Oct 2021 21:35:21 +0300
Message-Id: <20211028183527.3050-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211028183527.3050-1-semen.protsenko@linaro.org>
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Exynos7 watchdog driver is clearly indicating that its dts node must
define syscon phandle property. That was probably forgotten, so add it.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
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

