Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8626B254B9
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 May 2019 18:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbfEUQDl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 May 2019 12:03:41 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39818 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbfEUQDl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 May 2019 12:03:41 -0400
Received: by mail-wm1-f66.google.com with SMTP id n25so1625003wmk.4;
        Tue, 21 May 2019 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SyE9kuP93puOVa5bnxKzAz6P/q7rG15j4OqWFA5YadY=;
        b=T+vYrdTmZN/Md8Sf9dvxQNA0o0nZohyfU6cEOhtm/9KKtsEci4xzTwF5wwha/RbDcm
         hxWNAf+NMA09hM4YjOJI6kvZvazFJlDKG8ray2p2qXbvjxFyenWsP6msDiRkdpIIeTsc
         7lyZXOUNLnq/6d3I9HejXYYGL8HP+rpU3lsXxGPVEr5rQS8NJUxSKsFnMXer/ab76net
         atdfJRW7SM9srR81IAT/KY7wstpxt3hKyaRVFk9qzTyDpIGuYYgInFzk9/58pfWWERSr
         QtJRL7WPoVW/8/MKODfl5ocUuejtytfVzNMK2KaALG/t82pQfmBIVhNH4O7OJHx2A/s9
         05aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SyE9kuP93puOVa5bnxKzAz6P/q7rG15j4OqWFA5YadY=;
        b=HSZu6Vg45O1N/HP3Lyf8QEmAqCe0hcq95LmLaeRJT3C1ZcroBvSYlrXeQ7Dy2SAm+C
         rCmfjAu1vLmuAJW00gm3IIASkeE/++mbYHQ1JhIjbFLBLy6ofbngCrrNKZvjdx4aYQPf
         G/9LN6X1NBtThzT+g4tCSC8HFjLTCcWZGHW+b9UqoCeNqDk21we0/I5r76TQh9Jx3ycu
         S9vukTF1WCIq8vm/PEb98UoDlHLGoCJoQlLTskH7qFBIXj3q5CBYo61JSmTksaJ/uSXA
         Sct4E7YXHtDIe3nIU9JbsboIsEQ5WqPf3tyZOwMTWAllVX0jbJxHCcfgD4jaCtGjFKhu
         8V1Q==
X-Gm-Message-State: APjAAAULsYG42M9jYgCr62knyUf2VolBVUTfJgb4Rir9agw/5Z35bSoR
        1DlibGER0fknrTwJDyQrcsMM0vQLSTA7Sg==
X-Google-Smtp-Source: APXvYqwUHxJAUHN1YLpD84q4B8bKA40ChffErOtsXq3i2Uq3kGPqvW+6jtuDA211uTmP3GAi8TqfxA==
X-Received: by 2002:a1c:4087:: with SMTP id n129mr4099381wma.14.1558454618926;
        Tue, 21 May 2019 09:03:38 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id g11sm6853811wrq.89.2019.05.21.09.03.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 09:03:38 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v4 1/5] dt-bindings: watchdog: add Allwinner H6 watchdog
Date:   Tue, 21 May 2019 18:03:26 +0200
Message-Id: <20190521160330.28402-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521160330.28402-1-peron.clem@gmail.com>
References: <20190521160330.28402-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Allwinner H6 has a similar watchdog as the A64 which is already
a compatible of the A31.

This commit add the H6 compatible.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
index 46055254e8dd..e65198d82a2b 100644
--- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
@@ -6,6 +6,7 @@ Required properties:
 	"allwinner,sun4i-a10-wdt"
 	"allwinner,sun6i-a31-wdt"
 	"allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
+	"allwinner,sun50i-h6-wdt","allwinner,sun6i-a31-wdt"
 	"allwinner,suniv-f1c100s-wdt", "allwinner,sun4i-a10-wdt"
 - reg : Specifies base physical address and size of the registers.
 
-- 
2.17.1

