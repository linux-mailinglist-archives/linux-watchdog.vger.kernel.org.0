Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E3390559
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 Aug 2019 18:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbfHPQEC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 16 Aug 2019 12:04:02 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34242 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbfHPQEC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 16 Aug 2019 12:04:02 -0400
Received: by mail-pg1-f196.google.com with SMTP id n9so3169943pgc.1;
        Fri, 16 Aug 2019 09:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r15xV+pSvUz93fe9Op05lhHjyimxUmk5oIduSMlRE+A=;
        b=JdM3jUtPBbQDkLzajaWD6jVE6fQj4gee8v8Eq83IBHgZcKjyPv/AZVq0VfWEMLpYUQ
         ZU6Owvo1J9S2pYWi4Hj7r0IRGchjhlkbrAcRycGcOqE2tSCO2VJDafQFkENFH3S+hr4R
         NaP2/zKhUKJvM0EeoFAuqjvaI7HIkkF261RUkshtsqjDssYHnChk2sytsyKbouE9BDBO
         /IquPJrMBxpMKbqkED5JgbyKa/wIpC3upkER+sd60LpJM16bVxUQx/gvg6t7t5jPTtcE
         NGvPmyicV1wOycLhIfo8UiOvZ2sWmluaFGSD3IVmgPW08p2RJrAOpSsmvKEcFJuDxrHC
         Py5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=r15xV+pSvUz93fe9Op05lhHjyimxUmk5oIduSMlRE+A=;
        b=d4AnS3sgQNB4VEHGbWK2aGBeY+d2QR0G/Iu0/Mznj+SZFQdxp84+PI1QNQTqj/RtG1
         Z+uNoYoX7mpnx4oGS3qtVxtthNqEqKHy31NwnYlxLkRq6ShHqDzO+VwvUUfBYq996que
         +5U5CCpVUSCpTzXRUWJq0bZUdecHv/jNfg2NxT3AkKa6rwI6zkkBIYxxMnAbgVPR0Whc
         Cc2aYyLZUwujWo/l1rBHDHN30VkeVJ6bIcv+b7Sd047dr7xLv8rLsftlOoMuExw0xz90
         KuzjFti1oHQJC+YcCfS6YF1kfFi8XhCqBtNARxG0QQMA2PXMo+54O93H6goNZ8eZw7E/
         zQ8w==
X-Gm-Message-State: APjAAAWaU5r0zzu3V1qXWWpLorC+5pKyDX0kIoy/CepH0gaSxTjWGj+L
        3XpGCZbR7690gcCQaTYr/iM=
X-Google-Smtp-Source: APXvYqw434z92KZltolLhjc/SLek9lgPRJMm0aZV+vDRBoG/RmT4CDXtcqHryvIT64ugBYXHYnqTuQ==
X-Received: by 2002:a65:64c6:: with SMTP id t6mr8608739pgv.323.1565971441742;
        Fri, 16 Aug 2019 09:04:01 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id m20sm7578607pff.79.2019.08.16.09.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 09:04:01 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 1/2] dt-bindings: watchdog: Add ast2600 compatible
Date:   Sat, 17 Aug 2019 01:33:46 +0930
Message-Id: <20190816160347.23393-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190816160347.23393-1-joel@jms.id.au>
References: <20190816160347.23393-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds a compatible for the ast2600, a new ASPEED SoC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index c5077a1f5cb3..d78d4a8fb868 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -4,6 +4,7 @@ Required properties:
  - compatible: must be one of:
 	- "aspeed,ast2400-wdt"
 	- "aspeed,ast2500-wdt"
+	- "aspeed,ast2600-wdt"
 
  - reg: physical base address of the controller and length of memory mapped
    region
-- 
2.23.0.rc1

