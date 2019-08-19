Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D724B91C4E
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 07:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbfHSFRx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 01:17:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43747 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfHSFRx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 01:17:53 -0400
Received: by mail-pf1-f194.google.com with SMTP id v12so453449pfn.10;
        Sun, 18 Aug 2019 22:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=POHZpkPS//I34g8k/kk1/SY7LDbqKnT8nCOMJuIUBXw=;
        b=WtevONa4TaRG1SGxKo/EbUBePcgV7qdbDsZVbPt+gX0TR7SyAOHFQCmO1MUpuucFa6
         TEJ5/9ZywOrayfT8oTxrLOu5X/U4s2fKDA7gFzsQbzXzCyeiDYFOGMk5EAtIy7Tn0lai
         5Ah4eHo5QIJlnY3qsAeRMtcfubHa/DEhdAClxLSe9wPQdxTeJRGeZ5SnYAuVTE8eTuBh
         LCdwmMygIKcdcP+qL2BIfmHYU6O/Om3aS9tdOfKT6FCeVkPdEQ1RhM1DEszu7Syrk9/2
         M281Ewo3LADwRtWHC+BXJDJg/vE4RupoTKtfDFdYdUkz5pLMpApYO5FFTZ9vQXvJ+UJB
         FLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=POHZpkPS//I34g8k/kk1/SY7LDbqKnT8nCOMJuIUBXw=;
        b=Y9io+Je8p5ie/5lQiwtvfUu1UtEtZY1XFX6OBmwBeYuToy6X9vwGEnrspINObfIye1
         bkDZ5PYde96Y7mXpLbjHD12JZQp5Poj1DMfXDAp+iOZawOhPud5DMGaWNjZaY+GGuw7q
         mcADUj9CHRrkqjyxCw8+6BSFx6i0jf3qyqbN6KcamhipcDOaRDxhIb65fdmtgNKpm0aG
         aKUXc5jmQn+gqBl6c0BPmUNCrhjscJYNPWo2qmXSiPEhEcmnY1c7bT+egEvDW5tg6Zp2
         xAzcn/bBXGEIa1WmTzrO+MbEalw3onHr42sDzVluOeuaHTH3NIaRXLXCYdIGJhlzAmF9
         eOnw==
X-Gm-Message-State: APjAAAWNOPrHNbiR9Ea9wdnhE8inQbzU1iir9pHWWThAACmNOJNh1Cyp
        M66ks94dxUVwUOTJNTf/Skk=
X-Google-Smtp-Source: APXvYqx6I6EneoR0da6GR47cQfcPZWPNtpv7IgXI6pONXzKvyKww67S/CudJMaSqD+o3Gg0Lox1VzQ==
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr19430107pjr.132.1566191872230;
        Sun, 18 Aug 2019 22:17:52 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
        by smtp.gmail.com with ESMTPSA id o3sm19010087pje.1.2019.08.18.22.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2019 22:17:51 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Add ast2600 compatible
Date:   Mon, 19 Aug 2019 14:47:37 +0930
Message-Id: <20190819051738.17370-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190819051738.17370-1-joel@jms.id.au>
References: <20190819051738.17370-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds a compatible for the ast2600, a new ASPEED SoC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
v2:
 - Add Andrew's r-b
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

