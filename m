Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00DD9390928
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 May 2021 20:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbhEYSq1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 25 May 2021 14:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231934AbhEYSq1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 25 May 2021 14:46:27 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1630EC061756;
        Tue, 25 May 2021 11:44:57 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id o127so17305747wmo.4;
        Tue, 25 May 2021 11:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VR1JWU4nW1DmUrTHeiF6/6cj0vIS4fC0uA+HnyAg+8M=;
        b=e6tF+Gl+FBuOY9vs30nyw10JSUU778grJ2DshnLVoJi7XMeIkEtvMld0nDrcad4fT9
         V20yAwHapYpk4SHi7DForbIx0E/QbeG3Y/8Li4QH/fxbAj/ZW2Ik2Y7GZeHwB3AsPSSX
         tOvSUibxh7LZi1EI4ag9OpG/vh6b7Q5FWvdQd5gerkBhoSYrFZGplxpIqmA6RARFp8CW
         yj6+YWRQNgs+wJFIdlrk8WsS74FZltab1dYBcpTFdaJ2GRWua3NXJLGWcDDNukgZ3nPy
         1mKkGORDjfzUsI30TRzX3zTVM3yCJks2/2fYc7n6JizDXT6NRYPKrJoONsdqdS8Ce3Cq
         auRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VR1JWU4nW1DmUrTHeiF6/6cj0vIS4fC0uA+HnyAg+8M=;
        b=L2elv2G5FPAUPza9QQ69ffLMvJ/c3Vr1GJyybkku/38jES8za4QGENVXD6ZIb+lZa6
         0gEVO2XWTGtg9h6o5nNnuE+mp8ibm5xskAv6AICChTlpjJV0275EVUXCuOw+pMQZGbMz
         PIxkKAe3wAh+Nipe8Yv91k1E0qjawyNWbBhjgF94FHac+F8WXR3vnfE0FQzv4S8xS/mM
         XWgPY/oM8anGmrRHghqERgtBkHHlHUwXRWc3P4EAdwK+ZdJ3TYjt6lsoCjq095JlAt0u
         w/IySrfoxXFGGCmNRtkIEpXYsA8qHIxsiG0/rCkFlHciwjQ7zD+hstNQcQ7xRG0w0pr8
         WjBw==
X-Gm-Message-State: AOAM530oKWaY0ryo0SIW7rIea9OvzY1EDzTQ/Hgx+QkSGLYvlWEl9vuK
        QOlDSR5aWnCIEV/u2yCwoES6F74CSr8=
X-Google-Smtp-Source: ABdhPJxwo/trUdxbAPyfQNNO5rDy7YF9eIaqrWZ30hV4W8ZzFeOaO+Dt2gXGW5+3b4TiQSl/i5IQrQ==
X-Received: by 2002:a1c:80d0:: with SMTP id b199mr5048916wmd.6.1621968295417;
        Tue, 25 May 2021 11:44:55 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id u17sm7292456wrt.61.2021.05.25.11.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 11:44:55 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Documentation: watchdog: Add Mstar MSC313e WDT devicetree bindings documentation
Date:   Tue, 25 May 2021 20:44:47 +0200
Message-Id: <20210525184449.57703-2-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525184449.57703-1-romain.perier@gmail.com>
References: <20210525184449.57703-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds the documentation for the devicetree bindings of the Mstar
MSC313e watchdog driver, found from MSC313e SoCs and newer.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 .../bindings/watchdog/msc313e-wdt.yaml        | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml b/Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml
new file mode 100644
index 000000000000..70b8e1be5e8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/msc313e-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar Watchdog Device Tree Bindings
+
+maintainers:
+  - Daniel Palmer <daniel@0x0f.com>
+  - Romain Perier <romain.perier@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mstar,msc313e-wdt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog: watchdog@6000 {
+        compatible = "mstar,msc313e-wdt";
+        reg = <0x6000 0x1f>;
+        clocks = <&xtal_div2>;
+    };
-- 
2.30.2

