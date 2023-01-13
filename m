Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AECF3669449
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Jan 2023 11:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241253AbjAMKei (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Jan 2023 05:34:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241050AbjAMKeZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Jan 2023 05:34:25 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F163D3E87E
        for <linux-watchdog@vger.kernel.org>; Fri, 13 Jan 2023 02:34:04 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id u9so51353125ejo.0
        for <linux-watchdog@vger.kernel.org>; Fri, 13 Jan 2023 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7WPzmC5Oh9izsU3TrE1uZKgp8/c5G7tROX6eiyHIgY=;
        b=TeWE7d6JnqZbN8f0RMGiOR8UR8ssrwm7OglihKaBgLd7Zwov8JU2YVGMpBiXL5PlP7
         brgA2vuVJR81uYIpAQG2BFQhYVaMfkdJmeCsxAiGUWMLIveM6pIGt9tFoegtyJz2ECHS
         Ss4OuCKOUX03eD0Nk1CBeSjMefLZzEN4vdPy9nzXfof1HyCeDxivxr1nZ561h2wPKTUU
         uYC7qiyHuolm/Ps5PjqD1vEOEmU1DK2bz2eRyg0Lq1TtCuaXXVpW8tOjhIMTyq16uw0E
         74WEkWHIWjgQMHpr9/ydQcv3zVT2bbFluz5s0CCHt2ixTYk/3/rZ4e08Bziwnl9TgDo+
         j4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7WPzmC5Oh9izsU3TrE1uZKgp8/c5G7tROX6eiyHIgY=;
        b=HYzS5lJrlNePm+EqSa1A5bO0nJ8HrOYWqYhvABcLfJ9XkCz7ID7l5+QKkf1bG3pSJb
         2odcb6JEydYl/0TJTmh7SqoAYMl6FN1jniGJY5LcwLQy//hcENB4ZTdm/qrDxGSOIuzM
         nWnzCD1bgnWAVh93bUFP1d0ge1jDV0x7J5L1+0CJEIkIgrHJkmjigxh4lBM+0ArDtGSu
         2S6k4Muk88s0jFUkwKT3Q0KkySIXBLtyQzAVjOaQyOjbrTokCU5BaqNU5UzstObA9q89
         UHJx6eBHebMGZIoynsVy/0IlpmpNEWC2EsaOlyErQ27PyqDKKtV9npaHdRNgJ7CFwas4
         lAjA==
X-Gm-Message-State: AFqh2kq9vJJ94P1F6HTZFpHGyU1IqNFSYZVPHhkBr0a2EAXKBV8vnEgR
        NlVRVuAdSJFuYI8wj1iKsOCQvQ==
X-Google-Smtp-Source: AMrXdXtlbTT01BZOGgQNxInpR+kMgGqUmp1c1+Qqf27/VwCuxJGq4TZAVftXeQYimyAj62MLG7egZg==
X-Received: by 2002:a17:906:281b:b0:7c1:5863:f8c4 with SMTP id r27-20020a170906281b00b007c15863f8c4mr65076391ejc.21.1673606043565;
        Fri, 13 Jan 2023 02:34:03 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id qw25-20020a1709066a1900b007ae1e528390sm8296926ejc.163.2023.01.13.02.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:34:03 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 7/7] dt-bindings: watchdog: allow "timer" as node name
Date:   Fri, 13 Jan 2023 11:33:46 +0100
Message-Id: <20230113103346.29381-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113103346.29381-1-krzysztof.kozlowski@linaro.org>
References: <20230113103346.29381-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On some SoCs the watchdog device is actually mixed with timer, e.g.
the qcom,msm-timer on older Qualcomm SoCs where this is actually one
hardware block responsible for both system timer and watchdog.

Allow calling such device nodes as "timer".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Add tag.

See also:
https://lore.kernel.org/linux-arm-msm/20221212163532.142533-1-krzysztof.kozlowski@linaro.org/T/#t

which causes warnings:

qcom-msm8960-cdp.dtb: timer@200a000: $nodename:0: 'timer@200a000' does not match '^watchdog(@.*|-[0-9a-f])?$'
  From schema: Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
---
 Documentation/devicetree/bindings/watchdog/watchdog.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/watchdog.yaml b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
index fccae0d00110..519b48889eb1 100644
--- a/Documentation/devicetree/bindings/watchdog/watchdog.yaml
+++ b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
@@ -14,9 +14,14 @@ description: |
   This document describes generic bindings which can be used to
   describe watchdog devices in a device tree.
 
+select:
+  properties:
+    $nodename:
+      pattern: "^watchdog(@.*|-[0-9a-f])?$"
+
 properties:
   $nodename:
-    pattern: "^watchdog(@.*|-[0-9a-f])?$"
+    pattern: "^(timer|watchdog)(@.*|-[0-9a-f])?$"
 
   timeout-sec:
     description:
-- 
2.34.1

