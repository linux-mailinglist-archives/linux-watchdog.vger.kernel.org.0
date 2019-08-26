Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 777CF9CD80
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2019 12:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730815AbfHZKrN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Aug 2019 06:47:13 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:52268 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726616AbfHZKrM (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Aug 2019 06:47:12 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id 633BB42EE5;
        Mon, 26 Aug 2019 10:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:date:subject
        :subject:from:from:received:received:received; s=mta-01; t=
        1566816430; x=1568630831; bh=sDEjAIt5xHIASzEmtC/Trtueg2g59LDArRf
        QVSN+7T4=; b=tV1cLjpXjz8aSWpEAlBwXBqbEGUYEz64wHjdQ8NMfZBsIVR9O58
        3bibA7Kw+Qle+KB9G+5OEy+F9J9BWaPjBmwnbdaZLK/dkfSHxNYNWNG4Fh7dQ9XY
        eQ5Gv7+CqXhXPG4OKlD4ZL19gDa24cUVA30hGvh7Vb7yES+t7bpuvqCw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gltpLMrPWcoY; Mon, 26 Aug 2019 13:47:10 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id 64A0E42EEA;
        Mon, 26 Aug 2019 13:47:10 +0300 (MSK)
Received: from localhost.dev.yadro.com (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Mon, 26 Aug 2019 13:47:09 +0300
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
CC:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        Alexander Amelkin <a.amelkin@yadro.com>,
        <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>,
        Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: [PATCH v2 4/4] dt-bindings/watchdog: Add access_cs0 option for alt-boot
Date:   Mon, 26 Aug 2019 13:46:36 +0300
Message-ID: <20190826104636.19324-5-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826104636.19324-1-i.mikhaylov@yadro.com>
References: <20190826104636.19324-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The option for the ast2400/2500 to get access to CS0 at runtime.

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index c5077a1f5cb3..023a9b578df6 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -34,6 +34,13 @@ Optional properties:
                 engine is responsible for this.
 
  - aspeed,alt-boot:    If property is present then boot from alternate block.
+                       At alternate side 'access_cs0' sysfs file provides:
+                       ast2400: a way to get access to the primary SPI flash
+                                chip at CS0 after booting from the alternate
+                                chip at CS1.
+                       ast2500: a way to restore the normal address mapping from
+                                (CS0->CS1, CS1->CS0) to (CS0->CS0, CS1->CS1).
+
  - aspeed,external-signal: If property is present then signal is sent to
 			external reset counter (only WDT1 and WDT2). If not
 			specified no external signal is sent.
-- 
2.20.1

