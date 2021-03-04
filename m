Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8C832DCC1
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Mar 2021 23:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbhCDWMz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Mar 2021 17:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbhCDWMx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Mar 2021 17:12:53 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76095C061761
        for <linux-watchdog@vger.kernel.org>; Thu,  4 Mar 2021 14:12:53 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id p1so32575870edy.2
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Mar 2021 14:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v/pPDOAIiRjR7lEs29siBxnpMbhMpFCg4qL6RvapyuQ=;
        b=ZvgjxCFdW+xEIJQRTSrZL9RG99WKcuzdTurrplaWC8+EC8MZwlMwU+OBT9Nm8QNzO5
         NdOoYpYInzinJHNu6McP1uHtYkzgOrhNUi32Us+kUjDel5XCS1sga1lOsHnl9S6lAqYl
         N+2auUjyYr0kuUMvKyhGGBAlXCZ08f4U1dgJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v/pPDOAIiRjR7lEs29siBxnpMbhMpFCg4qL6RvapyuQ=;
        b=GHhdzH0CXqZm60pFufYAOC/7f+QtgCtdw5/RsUbCTcOYUVoEx20vYCc6aCeuoJ/Z8n
         fU33iUrdY+us6Etzz2jPFlRMKKEbWP6tG+1HpIFZJzExt6ZKnhi4VrHlMWJBZKqeTC/M
         0QHY9OFg0QZk6GPYSsNrrL+s2dhf3SAYq49IuuV6sUe2c+/3qfqPiQYJsC9N2cMTJbuB
         aSMiVHGWuaEHYN1t3Jspa2K6Nh5OyIt78NlacRtY3CHOL+PTVGpE8g1ooRgy24nErCjR
         yBqRmiIWao2rprNo2gv0udGMwlIBne2lgNrOc8XUGKpDZIxw4Nt2XW1AwmHMofkmwuRM
         IbHA==
X-Gm-Message-State: AOAM5315e3GjqUvwzWxByoL9kfHlLvOiCjv7XYkurmj+lY30MUtFgLuJ
        Re5VbWdH3hKMz55jCT5mKZKZYA==
X-Google-Smtp-Source: ABdhPJy3H4qGxTqJAT6Dy3t671giI6caxeE5c2SF84vG2D259IJR/Gin3MwbgSzzwbdGCsregOluwQ==
X-Received: by 2002:aa7:c889:: with SMTP id p9mr6615207eds.82.1614895972167;
        Thu, 04 Mar 2021 14:12:52 -0800 (PST)
Received: from prevas-ravi.prevas.se ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id q22sm362099ejy.5.2021.03.04.14.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 14:12:51 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: watchdog: add optional "delay" clock to gpio-wdt binding
Date:   Thu,  4 Mar 2021 23:12:46 +0100
Message-Id: <20210304221247.488173-3-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304221247.488173-1-linux@rasmusvillemoes.dk>
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
 <20210304221247.488173-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

[DO NOT MERGE - see cover letter]

We have a board where the reset output from the ADM706S is split in
two: directly routed to an interrupt, and also to start a ripple
counter, which 64 ms later than pulls the SOC's reset pin. That ripple
counter only works if the RTC's 32kHz output is enabled, and since
linux by default disables unused clocks, that effectively renders the
watchdog useless. So add an optional "delay" clock binding.

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 Documentation/devicetree/bindings/watchdog/gpio-wdt.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
index 198794963786..527be6b30451 100644
--- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
@@ -17,6 +17,10 @@ Optional Properties:
 - always-running: If the watchdog timer cannot be disabled, add this flag to
   have the driver keep toggling the signal without a client. It will only cease
   to toggle the signal when the device is open and the timeout elapsed.
+- clock-names: May contain the entry "delay" if the board has logic
+  that delays the reset signal from the watchdog and which requires an
+  external signal to function.
+- clocks: Phandles corresponding to the clock-names.
 
 Example:
 	watchdog: watchdog {
@@ -25,4 +29,6 @@ Example:
 		gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
 		hw_algo = "toggle";
 		hw_margin_ms = <1600>;
+		clock-names = "delay";
+		clocks = <&rtc 1>;
 	};
-- 
2.29.2

