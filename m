Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DED32DCC4
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 23:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhCDWMz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Mar 2021 17:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbhCDWMy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Mar 2021 17:12:54 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90BA3C061574
        for <linux-watchdog@vger.kernel.org>; Thu,  4 Mar 2021 14:12:52 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id jt13so52579719ejb.0
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Mar 2021 14:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IxSjyHvfhJ/CRzXpd7kM65mxSitdSKejDB4yVJ8QdLI=;
        b=SGDVknug8AsUYWYZSGdHKwErk1ohZtG+21USh8vDWbvcM6aFt8ZKYPoHP34FY7/Or4
         RqoAtJe0dwn1Bch/dFzWvOCOo/dEqgcOjFOFMzAB0e2Vh5Kw37/tNktSN79n3iIUqm/j
         jWI2HYdntIV9Dpa68IH6OENLdI+eeMvCb2PM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IxSjyHvfhJ/CRzXpd7kM65mxSitdSKejDB4yVJ8QdLI=;
        b=LSaD5CfueyvCjwi7q5ey3QUWcTUx/X8uhjKroR+z+B0u+NTE4qv2daXWR5irghC4dA
         tyXgZV1bhaIS/NgKgsR5+mGZXCwddr9aEV7DpiTXx3JL6ESLNPTQgEhuyg25FELWjVE3
         WxnvK51jn6QThhdrAOQamP7nEPWAIRhdm0sku6M3DetNCCWTfye5DXWebCNKzFkTYOoF
         /+0EUYTyQnsdbbW22tKdDbMValYGVK1xI4uDMlPJzLscwvvV5gwPbkKd0bO9me5Q9mtg
         6tpts0BQPcDxLYvkoq9Ji5UCaJBGPz1fsZAK71wREOypGHOTG/F4mH7NnEdn+CdF5qPq
         djZg==
X-Gm-Message-State: AOAM532fG7088anD4zWCX/y9t66rgPCLEcE2UDsXvXf/RKYPYYHaiKVL
        4SyfqPggiw2lU/Rh75sG0T9FTA==
X-Google-Smtp-Source: ABdhPJwVN0AcFGjBUTQ8VzGydpnWSzRyWvOOXLUP2ekeX/od+/cEZvBhl2UzMVMC2N0PmxVQKV+mMg==
X-Received: by 2002:a17:906:3acc:: with SMTP id z12mr6648419ejd.494.1614895971264;
        Thu, 04 Mar 2021 14:12:51 -0800 (PST)
Received: from prevas-ravi.prevas.se ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id q22sm362099ejy.5.2021.03.04.14.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 14:12:50 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 1/3] clk: add devm_clk_prepare_enable() helper
Date:   Thu,  4 Mar 2021 23:12:45 +0100
Message-Id: <20210304221247.488173-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304221247.488173-1-linux@rasmusvillemoes.dk>
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
 <20210304221247.488173-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add a managed wrapper for clk_prepare_enable().

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/clk/clk-devres.c                      | 29 +++++++++++++++++++
 include/linux/clk.h                           | 13 +++++++++
 3 files changed, 43 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index cd8b6e657b94..8ee2557f9ad7 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -253,6 +253,7 @@ CLOCK
   devm_clk_hw_register()
   devm_of_clk_add_hw_provider()
   devm_clk_hw_register_clkdev()
+  devm_clk_prepare_enable()
 
 DMA
   dmaenginem_async_device_register()
diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index be160764911b..d5bfa8cd7347 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -156,3 +156,32 @@ struct clk *devm_get_clk_from_child(struct device *dev,
 	return clk;
 }
 EXPORT_SYMBOL(devm_get_clk_from_child);
+
+static void devm_clk_disable_unprepare(struct device *dev, void *res)
+{
+	clk_disable_unprepare(*(struct clk **)res);
+}
+
+int devm_clk_prepare_enable(struct device *dev, struct clk *clk)
+{
+	struct clk **ptr;
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	ptr = devres_alloc(devm_clk_disable_unprepare, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = clk_prepare_enable(clk);
+	if (!ret) {
+		*ptr = clk;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(devm_clk_prepare_enable);
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 266e8de3cb51..04d135520480 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -485,6 +485,19 @@ struct clk *devm_clk_get_optional(struct device *dev, const char *id);
  */
 struct clk *devm_get_clk_from_child(struct device *dev,
 				    struct device_node *np, const char *con_id);
+/**
+ * devm_clk_prepare_enable - prepare and enable a clock source
+ * @dev: device for clock "consumer"
+ * @clk: clock source
+ *
+ * This function calls clk_prepare_enable() on @clk, and ensures the
+ * clock will automatically be disabled and unprepared when the device
+ * is unbound from the bus.
+ *
+ * Must not be called from within atomic context.
+ */
+int devm_clk_prepare_enable(struct device *dev, struct clk *clk);
+
 /**
  * clk_rate_exclusive_get - get exclusivity over the rate control of a
  *                          producer
-- 
2.29.2

